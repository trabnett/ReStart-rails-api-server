class CreateLoggedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :logged_items do |t|
      t.integer :user_id
      t.text :photo
      t.string :item_type
      t.float :item_type_prediction
      t.string :brand
      t.float :brand_prediction
      t.string :recycle_status
      t.float :recycle_status_prediction
      t.string :current_item_type
      t.string :current_brand
      t.string :current_recycle_status
      t.boolean :edited
      t.boolean :confirmed

      t.timestamps
    end
  end
end
