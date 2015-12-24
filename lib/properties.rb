require 'properties_pattern/version'

# Inspired by http://steve-yegge.blogspot.com/2008/10/universal-design-pattern.html
# +:undefined+ is equivalent to +undefined+ in JavaScript.
# See tests for details of behavior, which is similar to JavaScript's.
class Properties
  attr_accessor :mapping, :prototype

  BASE = Properties.new
  BASE.prototype = BASE
  BASE.mapping = Hash.new

  def inherit(new_properties)
    Properties.new self, @mapping.merge(new_properties)
  end

  def get(key)
    if chain_has? key
      prototype.get key
    elsif has? key
      @mapping[key]
    else
      :undefined
    end
  end

  def put(key, value)
    @mapping[key] = value
  end

  def has?(key)
    @mapping.has_key?(key) ||
       chain_has?(key)
  end

  def remove(key)
    @mapping.reject! { |k, _| k == key }
  end

  private

  def initialize(prototype=BASE, mapping=Hash.new)
    @prototype = prototype
    @mapping = mapping
  end

  def chain_has?(key)
    prototype != self && prototype.has?(key)
  end
end
