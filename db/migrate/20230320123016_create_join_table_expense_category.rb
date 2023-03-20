class CreateJoinTableExpenseCategory < ActiveRecord::Migration[7.0]
  def change
    create_join_table :expenses, :categories do |t|
      t.index [:expense_id, :category_id]
      t.index [:category_id, :expense_id]
    end
  end
end
