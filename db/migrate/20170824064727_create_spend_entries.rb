class CreateSpendEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :spend_entries do |t|
      t.float :amount
      t.belongs_to :user, index: true
      t.belongs_to :spend_category_user, index: true
      t.timestamps
    end
  end
end
