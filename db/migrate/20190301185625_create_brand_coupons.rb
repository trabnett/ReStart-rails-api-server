class CreateBrandCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_coupons do |t|
      t.integer :brand_id
      t.string :code
      t.date :expiary_date
      t.text :content
      t.integer :item_number

      t.timestamps
    end
  end
end
