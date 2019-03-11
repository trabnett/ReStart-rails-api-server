class BrandsController < ApplicationController

    def create
        @brand = Brand.new(user_params)
        @brand.password = params[:password]
        @brand.save!
        render json: {alert: "brand created", brand_id: @brand.id}
    end

    def login
        @brand = Brand.find_by_email(params[:email])
        if @brand.password == params[:password]
            give_token
        else
            render json: {alert: "error logging in"}
        end
    end

    def user_params
        params.permit(:name, :email, :password, :password_confirmation)
    end

end
