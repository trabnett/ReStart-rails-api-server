class ChangeValueToBeFloatInBrandCoupons < ActiveRecord::Migration[5.2]
  def change
    change_column :brand_coupons, :value, :float
  end
end
