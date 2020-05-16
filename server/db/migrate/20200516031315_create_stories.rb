class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :content
      t.integer :acquaintancesid

      t.timestamps
    end
  end
end
