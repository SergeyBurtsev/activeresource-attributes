# Active Resource Attributes

This gem is ~a monkey-patch~ an extension for [ActiveResource](https://github.com/rails/activeresource) which integrates [ActiveModel::Attributes](https://github.com/rails/rails/blob/main/activemodel/lib/active_model/attributes.rb) module and allows to define attributes for type casting and default values.

## Installation
Add gem to your Gemfile

```ruby
gem "activeresource-attributes"
```

## Usage
Include the module in the ActiveResource model and define your attributes

```ruby
class Person < ActiveResource::Base
  self.site = "http://example.com"

  include ActiveResourse::Attributes

  attribute :integer_field, :integer
  attribute :string_field, :string
  attribute :float_field, :float
  attribute :date_field, :date
  attribute :boolean_field, :boolean
  attribute :field_with_default_value, :integer, default: 123
end
```

The values are casted to the defined types and default values are supported.

```ruby
person = Person.new

person.integer_field = "2.3"
person.integer_field # => 2

person.float_field = "12.3"
person.float_field # => 12.3

person.date_field = "2016-01-01"
person.date_field # => Fri, 01 Jan 2016

person.boolean_field = "0"
person.boolean_field # => false

person.field_with_default_value # => 123
```

## Contribution

Please, feel free to contribute and report any bugs.
