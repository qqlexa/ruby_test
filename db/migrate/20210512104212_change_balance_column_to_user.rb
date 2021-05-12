class ChangeBalanceColumnToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :balance, :float, default: 0
  end
end
