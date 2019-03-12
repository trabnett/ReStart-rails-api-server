class RemoveContentFromBrandCoupons < ActiveRecord::Migration[5.2]
  def change
    remove_column :brand_coupons, :content
  end
end
