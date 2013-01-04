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
Loading development environment (Rails 3.2.10)
irb(main):001:0> u = User.create(:email => "foo@bar.com")
irb(main):002:0> u.notification
=> true
irb(main):003:0> u.notification = false
=> false
irb(main):004:0> u.notification
=> false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
