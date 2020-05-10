class CreateAcquaintances < ActiveRecord::Migration[6.0]
  def change
    create_table :acquaintances do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, :null => false
      t.string :nickname

      t.timestamps
    end
    add_index :acquaintances, :name
  end
end
