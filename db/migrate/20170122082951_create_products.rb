class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :des
      t.string :size
      t.string :color
      t.string :color
      t.string :tag
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
