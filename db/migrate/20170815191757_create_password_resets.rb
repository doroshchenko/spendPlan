class CreatePasswordResets < ActiveRecord::Migration[5.0]
  def change
    create_table :password_resets do |t|
      t.belongs_to :user, index: true
      t.string :token

      t.timestamps
    end
  end
end
