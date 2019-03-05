class CreateCouponInstances < ActiveRecord::Migration[5.2]
  def change
    create_table :coupon_instances do |t|
      t.integer :coupon_id
      t.date :issue_date
      t.string :status
      t.date :date_used
      t.text :barcode
      t.integer :user_id

      t.timestamps
    end
  end
end
