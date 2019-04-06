class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        @user.password = params[:password]
        @user.save!
        render json: {alert: "user created", user: @user}
    end

    def login
        @user = User.find_by_email(params[:email])
        if @user.password == params[:password]
            give_token
        else
            render json: {alert: "error logging in"}
        end
    end

    def update
        @user = User.find_by_email(params[:email])
        if params[:first_name]
            @user.first_name = params[:first_name]
        end
        if params[:last_name]
            @user.last_name = params[:last_name]
        end
        if params[:update_email]
            @user.email = params[:update_email]
        end
        if params[:postcode]
            @user.postcode = params[:postcode]
        end
        if params[:update_password] && params[:update_password_confirmation]
            @user.password = params[:update_password]
            @user.password_confirmation = params[:update_password_confirmation]
        end
        @user.save

        render json: @user
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :postcode, :update_email)
    end

end
