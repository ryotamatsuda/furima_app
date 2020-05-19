class CreateUntradedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :untraded_products do |t|
      t.integer :seller_id, null: false
      t.string :name, null: false
      t.integer :quality_condition, null: false
      t.boolean :writing?, null: false, default: false
      t.integer :image_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
