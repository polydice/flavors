# -*- encoding : utf-8 -*-
class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :name
      t.boolean :value
      t.integer :prefered_id
      t.string :prefered_type

      t.timestamps
    end

    add_index :preferences, :prefered_id
    add_index :preferences, :prefered_type
    add_index :preferences, :name
  end
end
