class CreateTradedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :traded_products do |t|
      t.integer :seller_id, null: false
      t.string :name, null: false
      t.integer :quality_condition, null: false
      t.boolean :writing?, null: false, default: false
      t.integer :image_id, null: false
      t.integer :price, null: false
      t.integer :buyer_id, null: false
      t.integer :trading_condition, null: false, default: 0
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :distination_name, null: false
      t.timestamps
    end
  end
end
