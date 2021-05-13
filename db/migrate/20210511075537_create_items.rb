# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :body
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
