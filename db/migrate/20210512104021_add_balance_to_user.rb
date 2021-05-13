# frozen_string_literal: true

class AddBalanceToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :balance, :float
  end
end
