require 'rails/generators'
require 'rails/generators/migration'

module Flavors
  class MigrationGenerator < ::Rails::Generators::Base
    include ::Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    def self.next_migration_number( dirname )
      next_migration_number = current_migration_number(dirname) + 1
      if ActiveRecord::Base.timestamped_migrations
        [Time.now.utc.strftime("%Y%m%d%H%M%S%6N"), "%.20d" % next_migration_number].max
      else
        "%.3d" % next_migration_number
      end
    end

    def create_model_file
      migration_template "create_preferences.rb", "db/migrate/create_preferences.rb"
    end
  end
end
