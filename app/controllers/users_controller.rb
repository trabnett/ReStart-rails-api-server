class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        @user.password = params[:password]
        @user.save!
        CouponInstance.create(coupon_id: 1, issue_date: "1-1-2012".to_date, status: "pending", date_used: "1-1-2019".to_date, barcode: "78907", user_id: @user.id)
        CouponInstance.create(coupon_id: 2, issue_date: "1-1-2012".to_date, status: "pending", date_used: "1-1-2019".to_date, barcode: "61524 ", user_id: @user.id)
        render json: {alert: "user created", user_id: @user.id}
    end

    def login
        @user = User.find_by_email(params[:email])
        if @user.password == params[:password]
            give_token
            @user.points = 1020
        else
            render json: {alert: "error logging in"}
        end
    end

    def user_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
