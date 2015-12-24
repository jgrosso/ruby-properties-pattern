require 'test_helper'

class PropertiesTest < Minitest::Test
  def setup
    @object1 = Properties::BASE.inherit test: :test
    @object2 = @object1.inherit test2: :test2
    @object3 = @object2.inherit test3: :test3, test4: :test4
  end

  def test_version_number
    refute_nil PropertiesPattern::VERSION
  end

  def test_get
    assert_equal Properties::BASE.get(:test), :undefined

    assert_equal @object1.get(:test), :test

    assert_equal @object2.get(:test), :test
    assert_equal @object2.get(:test2), :test2

    assert_equal @object3.get(:test), :test
    assert_equal @object3.get(:test2), :test2
    assert_equal @object3.get(:test3), :test3
    assert_equal @object3.get(:test4), :test4
  end

  def test_put_and_remove
    Properties::BASE.put :test5, :test5
    assert_equal Properties::BASE.get(:test5), :test5
    assert_equal @object1.get(:test5), :test5
    assert_equal @object2.get(:test5), :test5
    assert_equal @object3.get(:test5), :test5

    @object1.put :test6, :test6
    assert_equal Properties::BASE.get(:test6), :undefined
    assert_equal @object1.get(:test6), :test6
    assert_equal @object2.get(:test6), :test6
    assert_equal @object3.get(:test6), :test6

    Properties::BASE.remove :test5
    assert_equal Properties::BASE.get(:test5), :undefined
    assert_equal @object1.get(:test5), :undefined
    assert_equal @object2.get(:test5), :undefined
    assert_equal @object3.get(:test5), :undefined

    @object1.remove :test6
    assert_equal @object1.get(:test6), :undefined
    assert_equal @object2.get(:test6), :undefined
    assert_equal @object3.get(:test6), :undefined
  end

  def test_has?
    assert @object1.has?(:test)

    assert @object2.has?(:test)
    assert @object2.has?(:test2)

    assert @object3.has?(:test)
    assert @object3.has?(:test2)
    assert @object3.has?(:test3)
    assert @object3.has?(:test4)
  end

  def test_prototype_of_base_is_base
    assert_equal Properties::BASE.prototype, Properties::BASE
  end

  def test_put_leaves_prototype_unchanged
    @object1.put :test5, :test5

    assert !Properties::BASE.has?(:test5)
    assert_equal @object1.get(:test5), :test5
  end

  def test_prototype
    assert_equal @object1.prototype, Properties::BASE
    assert_equal @object2.prototype, @object1
    assert_equal @object3.prototype, @object2

    assert_equal @object3.prototype.prototype.prototype, Properties::BASE
    assert_equal @object3.prototype.prototype.prototype.prototype, Properties::BASE
  end
end
