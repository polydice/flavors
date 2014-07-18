require 'coveralls'
Coveralls.wear!

require 'rspec'
require 'flavors'
require 'shoulda-matchers'

require "rails/test_unit/railtie"

RSpec.configure do |config|
  config.color     = true
  config.formatter = 'documentation'
end

# Define the application and configuration
module Config
  class Application < ::Rails::Application
  end
end

Config::Application.initialize!

# Setup test environment for ActiveRecord
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)

load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/user.rb'
load File.dirname(__FILE__) + '/support/post.rb'
