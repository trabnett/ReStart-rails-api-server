class ChangeCouponInstances < ActiveRecord::Migration[5.2]
  def change
    add_column :coupon_instances, :amount, :float
    add_column :coupon_instances, :expiry_date, :date
  end
end
