require 'active_support/concern'

module Flavors
  module Preferences
    extend ::ActiveSupport::Concern

    included do
      @@preferences = {}
    end

    module ClassMethods
      def preference(name, options = {})
        has_many :preferences, :as => :prefered, :class_name => "Flavors::Preference"

        preferences = self.class_variable_get(:'@@preferences')
        default ||= options[:default]
        preferences[name] = default
        self.class_variable_set(:'@@preferences', preferences)

        define_method(name) do
          read_preference(name)
        end

        define_method("#{name}=") do |value|
          write_preference(name, value)
        end
      end

      private

      def preferences
        self.class_variable_get(:'@@preferences')
      end
    end

    def read_preference(name)
      if p = self.preferences.where(:name => name).first
        return p.value
      end

      return @@preferences[name] if @@preferences.has_key?(name)
      nil
    end

    def write_preference(name, value)
      p = self.preferences.find_or_create_by_name(name)
      p.update_attribute(:value, value)
    end
  end
end
