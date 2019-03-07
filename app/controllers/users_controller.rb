class UsersController < ApplicationController

    def register
        user = User.new(user_params)
        byebug
        if user.save
            render json: {alert: "user created"}
        else
          render json: {alert: "nope"}
        end
    end 

    def user_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :password_digest)
    end

end
