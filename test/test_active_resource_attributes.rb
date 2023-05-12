require "minitest/autorun"
require "active_resource_attributes"

class ActiveResourceAttributesTest < Minitest::Test
  class Person < ActiveResource::Base
    include ActiveResource::Attributes

    self.site = "http://example.com"

    attribute :integer_field, :integer
    attribute :string_field, :string
    attribute :float_field, :float
    attribute :date_field, :date
    attribute :boolean_field, :boolean
    attribute :field_with_default_value, :integer, default: 123
  end

  def test_attributes
    person = Person.new
    binding.irb
    person.integer_field = "2.3"
    person.string_field = "Rails FTW"
    person.float_field = "12.3"
    person.date_field = "2016-01-01"
    person.boolean_field = "0"

    assert_equal 2, person.integer_field
    assert_equal "Rails FTW", person.string_field
    assert_equal 12.3, person.float_field
    assert_equal Date.new(2016, 1, 1), person.date_field
    assert_equal false, person.boolean_field
    assert_equal 123, person.field_with_default_value

    person = Person.new(
      integer_field: "2.3",
      string_field: "Rails FTW",
      float_field: "12.3",
      date_field: "2016-01-01",
      boolean_field: "0"
    )

    assert_equal 2, person.integer_field
    assert_equal "Rails FTW", person.string_field
    assert_equal 12.3, person.float_field
    assert_equal Date.new(2016, 1, 1), person.date_field
    assert_equal false, person.boolean_field
  end
end
