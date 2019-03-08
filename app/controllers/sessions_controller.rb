class SessionsController < ApplicationController

    def new
        # No need for anything in here, we are just going to render our
        # new.html.erb AKA the login page
    end

    def create
        # Look up User in db by the email address submitted to the login form and
        # convert to lowercase to match email in db in case they had caps lock on:
        user = User.find_by(email: params[:email])
        
        # Verify user exists in db and run has_secure_password's .authenticate() 
        # method to see if the password submitted on the login form was correct: 
        if user && user.authenticate(params[:password]) 
            # Save the user.id in that user's session cookie:
            session[:user_id] = user.id.to_s
            coupons = CouponInstance.where(user_id: user.id)
            response = {alert: "sucessful login", session_id: session[:user_id], coupons: coupons}
            render json: response
        else
            # if email or password incorrect, re-render login page:
            render json: {alert: "There is a problem with your login. Please make sure you have a correct email and password."}
        end
    end

    def destroy
        # delete the saved user_id key/value from the cookie:
        session.delete(:user_id)
        response = {alert: "user logged out"}
        render json: response
    end

end
