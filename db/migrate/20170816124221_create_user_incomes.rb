class CreateUserIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_incomes do |t|
      t.string :amount
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
