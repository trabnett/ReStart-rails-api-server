class CouponsController < ApplicationController

    def show
        # hardcoded for user_id: 1
        # @coupons = CouponInstance.where(user_id: params[:id]).all
        @coupons = CouponInstance.where(user_id: 1).all
        render json: @coupons

    end

end
