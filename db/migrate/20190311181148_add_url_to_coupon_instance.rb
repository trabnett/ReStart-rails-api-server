class AddUrlToCouponInstance < ActiveRecord::Migration[5.2]
  def up
    add_column :coupon_instances, :logo, :string
  end

  def down
    remove_column :coupon_instances, :logo, :string
  end
end
