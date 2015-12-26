# Properties Pattern

[![Gem Version](https://badge.fury.io/rb/properties_pattern.svg)](https://badge.fury.io/rb/properties_pattern)
[![Code Climate](https://codeclimate.com/github/jgrosso/ruby-properties-pattern/badges/gpa.svg)](https://codeclimate.com/github/jgrosso/ruby-properties-pattern)

Use the Properties pattern (e.g. JavaScript's object system) in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'properties_pattern'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install properties_pattern

## Usage

Create a new object with `Properties::BASE.inherit new_properties_hash`, *NOT* `Properties.new` (otherwise, prototypes will not work out of the box).

Inherit from an existing object with `existing_object.inherit new_properties_hash`

Get property from object or it's prototype chain with `existing_object.get property_name`

Set property in object with `existing_object.put property_name, property_value`

See if object has property with `existing_object.has? property_name`

Remove property from object with `existing_object.remove property_name`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/properties_pattern. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

