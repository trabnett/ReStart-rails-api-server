class CouponsController < ApplicationController

    def index
        @coupons = CouponInstance.where(user_id: 1).all
        render json: @coupons.reverse

    end

end
