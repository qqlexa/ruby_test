class AddDefaultFieldToSignCountToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :sign_in_count, :integer, default: 0
  end
end
