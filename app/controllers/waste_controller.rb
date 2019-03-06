require 'faraday'
require 'faraday_middleware'
require 'dotenv'
require "json"
require "ibm_watson/visual_recognition_v3"
include IBMWatson

class WasteController < ApplicationController
    def create
        url = params['url']

        conn = Faraday.new(url: "https://gateway.watsonplatform.net/visual-recognition/api/v3/classify/") do |conn|
            conn.use FaradayMiddleware::ParseJson, content_type: "application/json"
            conn.use Faraday::Adapter::NetHttp
        end
        conn.basic_auth('apikey', 'BPMTSxeoRLbKg6iYtfvufZNqplvT8OhSkRAReNFDQSlB')
        response = conn.get("?url=#{url}")
        recycle = response.body["images"][0]["classifiers"][0]["classes"][0]["class"]
        recycle_prediction = response.body["images"][0]["classifiers"][0]["classes"][0]["score"]
        
        @logged_item = LoggedItem.find(7)
        @logged_item["recycle_status"] = recycle
        @logged_item["recycle_status_prediction"] = recycle_prediction
        @logged_item.save
        
        render json: response.body





    end

end
