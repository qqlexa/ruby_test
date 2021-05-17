# frozen_string_literal: true

class AddSignInCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :sign_in_count, :integer
  end
end
