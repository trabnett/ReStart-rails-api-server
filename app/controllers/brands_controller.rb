class BrandsController < ApplicationController

    def create
        @brand = Brand.new(brand_params)
        @brand.password = params[:password]
        @brand.save!
        render json: {alert: "brand created", brand: @brand}
    end

    def login
        @brand = Brand.find_by_email(params[:email])
        if @brand.password == params[:password]
            give_token
        else
            render json: {alert: "error logging in"}
        end
    end

    def update
        @brand = Brand.find_by_email(params[:email])
        if params[:name]
            @brand.name = params[:name]
        end
        if params[:update_email]
            @brand.email = params[:update_email]
        end
        if params[:update_password] && params[:update_password_confirmation]
            @brand.password = params[:update_password]
            @brand.password_confirmation = params[:update_password_confirmation]
        end
        if params[:logo]
            @brand.logo = params[:logo]
        end

        @brand.save
        render json: @brand
    end

    def brand_params
        params.permit(:email, :password, :password_confirmation, :update_email, :update_password, :update_password_confirmation)
    end

end
