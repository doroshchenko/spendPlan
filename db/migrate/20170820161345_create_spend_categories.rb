class CreateSpendCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :spend_categories do |t|
      t.string :name
      t.text :description
      t.boolean :is_default
      t.integer :default_amount
      t.timestamps
    end

  end
end
