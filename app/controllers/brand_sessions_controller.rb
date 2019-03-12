class BrandSessionsController < ApplicationController

    def new
        # No need for anything in here, we are just going to render our
        # new.html.erb AKA the login page
    end

    def create
        # Look up User in db by the email address submitted to the login form and
        # convert to lowercase to match email in db in case they had caps lock on:
        brand = Brand.find_by(email: params[:email])
        
        # Verify user exists in db and run has_secure_password's .authenticate() 
        # method to see if the password submitted on the login form was correct: 
        if brand && brand.authenticate(params[:password]) 
            # Save the user.id in that user's session cookie:
            if brand.name
                name = brand.name
            end
            session[:brand_id] = brand.id.to_s
            response = {alert: "sucessful login", 
                        session_id: session[:brand_id], 
                        email: brand.email,
                        brand_name: name,
                        brand_logo: brand.logo
                        }
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