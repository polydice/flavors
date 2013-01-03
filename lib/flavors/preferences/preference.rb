require 'active_record'

module Flavors
  class Preference < ::ActiveRecord::Base
    belongs_to :prefered, :polymorphic => true
  end
end
