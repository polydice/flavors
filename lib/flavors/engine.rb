require 'flavors/preferences/preferences.rb'
require 'flavors/preferences/preference.rb'

require 'rails'

module Flavors
  class Engine < ::Rails::Engine
    initializer "flavors" do
      ::ActiveRecord::Base.send :include, Flavors::Preferences
    end
  end
end
