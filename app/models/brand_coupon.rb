class BrandCoupon < ApplicationRecord
    belongs_to :brand, foreign_key: :brand_id
end
