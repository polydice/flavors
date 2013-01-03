# -*- encoding : utf-8 -*-
class Preference < ActiveRecord::Base
  belongs_to :prefered, :polymorphic => true

  attr_accessible :name, :value
end
