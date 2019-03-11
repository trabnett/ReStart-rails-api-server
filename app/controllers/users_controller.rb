class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        @user.password = params[:password]
        @user.save!
        render json: {alert: "user created", user_id: @user.id}
    end

    def login
        @user = User.find_by_email(params[:email])
        if @user.password == params[:password]
            give_token
        else
            render json: {alert: "error logging in"}
        end
    end

    def user_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
