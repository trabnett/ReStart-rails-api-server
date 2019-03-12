class ChangeBrandCouponContentColumnToValue < ActiveRecord::Migration[5.2]
  def change
    add_column :brand_coupons, :value, :float
  end
end
