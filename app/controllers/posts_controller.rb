require 'faraday'
require 'dotenv'


class PostsController < ApplicationController

    def index

    end

    def create
        conn = Faraday.new
        res = conn.post do |req|
            req.url 'https://api.logograb.com/detect'
            req.headers['X-DEVELOPER-KEY'] = ENV['LOGO_GRAB_KEY']
            # params['url'] is an arbitrary name I made up for information comming in from Postman. It represents the url of the photo stored in aws.
            req.params['mediaUrl'] = params['url']
            req.headers['Content-Type'] = 'application/x-www-form-urlencoded'

        end
        brand = JSON.parse res.body
        puts brand['data']['detections'][0]['name']
        puts brand['data']['detections'][0]['confidenceALE']
        render json: res.body
    end







    private
  
    def loggedItem_params
      params.permit(:brand)
    end
  

end


