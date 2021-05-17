class ChangeColumnNameAnswerToAnswerId < ActiveRecord::Migration[6.1]
  def change
    rename_column :questions, :answer, :answer_id
  end
end
