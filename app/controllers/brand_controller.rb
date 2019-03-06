require 'faraday'
require 'dotenv'


class BrandController < ApplicationController

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
        response = JSON.parse res.body
        name = response['data']['detections'][0]['name']
        brand_prediction = response['data']['detections'][0]['confidenceALE']

        @logged_item = LoggedItem.find(7)
        @logged_item["brand"] = name
        @logged_item["brand_prediction"] = brand_prediction
        @logged_item.save



        render json: @loggedItem
    end







    private
  
    def loggedItem_params
      params.permit(:brand)
    end
  

end