class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|

      t.string :user_name
      t.boolean :trainer
      t.integer :user_id

      t.timestamps
    end
  end
end
