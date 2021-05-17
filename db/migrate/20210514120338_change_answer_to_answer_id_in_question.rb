class ChangeAnswerToAnswerIdInQuestion < ActiveRecord::Migration[6.1]
  def change
    change_column :questions, :answer, :integer
  end
end
