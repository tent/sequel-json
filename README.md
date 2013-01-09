# Sequel::Plugins::Json

Sequel ORM Plugin for serializing columns as JSON.

## Installation

Add this line to your application's Gemfile:

    gem 'sequel-json'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sequel-json

## Usage

```ruby
require 'sequel-json'

DB = Sequel.connect(ENV['DATABASE_URL'])

class Person < Sequel::Model(:people)
  plugin :serialization
  serialize_attributes :json, :profile
end

unless DB.table_exists?(:people)
  DB.create_table :people do
    primary_key :id
    column :profile, "text", :default=>"{}"
  end
  Person.columns # load columns
end

person = Person.create(
  :profile => {
    "name" => "Unknown",
    "age" => 30
  }
)
person.profile # => { "name" => "Unknown", "age" => 30 }
person.profile["city"] = "New York"
person.id # => 1
person.save

person = Person.first(:id => 1)
person.profile # => { "name" => "Unknown", "age" => 30, "city" => "New York" }
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
