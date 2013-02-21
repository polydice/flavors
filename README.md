# Flavors

Simple and flexible preferences integration for ActiveRecord models.

## Installation

Add this line to your application's Gemfile:

    gem 'flavors'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flavors

## Usage

To add preferences to your ActiveRecord model, in your model file:

```
class User < ActiveRecord::Base
  preference :receive_email, :default => true
end
```

Then you can then use the methods provided by flavors to read / write preferences.

```
Loading development environment (Rails 3.2.12)
irb(main):001:0> u = User.create(:email => "foo@bar.com")
irb(main):002:0> u.notification
=> true
irb(main):003:0> u.notification = false
=> false
irb(main):004:0> u.notification
=> false
```

From 0.2.0, Flavors also supports callback block for preference setter.

```
class User < ActiveRecord::Base
  preference :receive_email, :default => true do |object, value|
    puts "#{object.name} sets preference to #{value}"
  end
end
```

When you set preference of instances, the callback block will be invoked.

```
Loading development environment (Rails 3.2.12)
irb(main):001:0> u = User.create(:name => "foo", :email => "foo@bar.com")
irb(main):002:0> u.notification = true
foo sets preference to true
=> true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
