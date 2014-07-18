require 'active_support/concern'

module Flavors
  module Preferences
    extend ::ActiveSupport::Concern

    module ClassMethods
      def preference(name, options = {}, &callback)
        has_many :preferences, :as => :prefered, :class_name => "::Flavors::Preference"

        define_method(name) do
          read_preference(name, options[:default])
        end

        define_method("#{name}?") do
          read_preference(name, options[:default])
        end

        define_method("#{name}=") do |value|
          write_preference(name, value)
          callback.call(self, value) if callback
        end
      end
    end

    def read_preference(name, default = nil)
      if p = self.preferences.where(:name => name).first
        p.value
      else
        default
      end
    end

    def write_preference(name, value)
      p = self.preferences.where(:name => name).first_or_create
      p.update_attribute(:value, value)
    end
  end
end
