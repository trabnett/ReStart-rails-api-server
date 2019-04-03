class Brands::CouponsController < ApplicationController

    def new
        if params[:brand_name]
            brand = Brand.find_by(name: params[:brand_name])
            @brand_coupon = BrandCoupon.create(brand_id: brand.id, code: params[:code], expiary_date: params[:expiry_date,], value: params[:coupon_value])
            res = {new_coupon: @brand_coupon}
            render json: res
        else
            render json: {hey: "whats happening"}
        end
        
    end

    def index 
        brand = Brand.find_by(email: params[:email])
        coupons = BrandCoupon.where(brand_id: brand.id).all
        res = {coupons: coupons.reverse}
        byebug
        render json: res
    end

    def destroy
        BrandCoupon.destroy(params[:id])
    end

    def coupon_params
        params.permit(:brand_id, :value, :expiary_date, :content, :password_confirmation)

    end
end
