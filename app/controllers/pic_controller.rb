require "base64"

class PicController < ApplicationController
    def create
        session_id = 1
        encoded_string = Base64.strict_decode64(request.body.read)

        new_file = File.new('./tmp/storage/test.png', 'wb')
        new_file.write(encoded_string)
        new_file.close
        s3 = Aws::S3::Resource.new(access_key_id: ENV['S3_KEY'],
        secret_access_key: ENV['S3_SECRET_KEY'],
        region: ENV['S3_REGION'],)
        file = './tmp/storage/test.png'
       
        counter = LoggedItem.count
        user = User.find(session_id)
        name = "#{user.last_name}#{counter}.png"

        obj = s3.bucket(ENV['S3_BUCKET']).object(name)
        obj.upload_file(file)
 
        url = "https://s3-us-west-2.amazonaws.com/restartlighthouselabs/#{name}"


        conn = Faraday.new(url: "https://gateway.watsonplatform.net/visual-recognition/api/v3/classify/") do |conn|
            conn.use FaradayMiddleware::ParseJson, content_type: "application/json"
            conn.use Faraday::Adapter::NetHttp
        end
        conn.basic_auth('apikey', ENV['WATSON_API'])
        response = conn.get("?url=#{url}&version=2019-03-10&classifier_ids=waste_549934001")
        recycle = response.body["images"][0]["classifiers"][0]["classes"][0]["class"]
        recycle_prediction = response.body["images"][0]["classifiers"][0]["classes"][0]["score"]
        
        logged_item = LoggedItem.new
        logged_item.user_id = session_id
        logged_item["recycle_status"] = recycle
        current_points = user.points

        if recycle == "Recycle"
            final_points = 80 + current_points
        elsif recycle == "Compost"
            final_points = 100 + current_points
        elsif recycle == "Hazardous"
            final_points = 60 + current_points
        else
            final_points = 0 + current_points
        end
        
        user.update_attributes(points: final_points)
            
        logged_item["recycle_status_prediction"] = recycle_prediction
        logged_item["photo"] = url

        conn = Faraday.new
        res = conn.post do |req|
            req.url 'https://api.logograb.com/detect'
            req.headers['X-DEVELOPER-KEY'] = ENV['LOGO_GRAB_KEY']
            # params['url'] is an arbitrary name I made up for information comming in from Postman. It represents the url of the photo stored in aws.
            req.params['mediaUrl'] = url
            req.headers['Content-Type'] = 'application/x-www-form-urlencoded'

        end
        response2 = JSON.parse res.body
        if (response2['data']['detections'].empty?)
            logged_item["brand"] = "No Brand Detected"
            logged_item["brand_prediction"] = 1
            name2 = "No Brand Detected"
            brand_prediction = 1
        else
            name2 = response2['data']['detections'][0]['name']
            brand_prediction = response2['data']['detections'][0]['confidenceALE']
            logged_item["brand"] = name2
            logged_item["brand_prediction"] = brand_prediction
        end



        chunk = {
            'inputs': [
              {
                'data': {
                  'image': {
                    'url': url
                  }
                }
              }
            ]
        }
        body = chunk.to_json
        conn = Faraday.new
        resp = conn.post do |req|
            req.url 'https://api.clarifai.com/v2/models/ReStart%20app/outputs'
            req.headers['Authorization'] = "Key #{ENV['CLARIFAI_API']}"
            req.headers['Content-Type'] = "application/json"
            req.body = body
        end
        response3 = JSON.parse resp.body

        logged_item["item_type"] = response3["outputs"][0]['data']['concepts'][0]['name']
        logged_item["item_type_prediction"] = response3["outputs"][0]['data']['concepts'][0]['value']

        output1 = logged_item["item_type"]
        output2 = logged_item["item_type_prediction"]

        logged_item.save

        if Brand.exists?(name: name2)
            brand = Brand.where(name: name2)
            brand_id = brand[0]["id"].to_i
            newest_brand_coupon = BrandCoupon.where(brand_id: brand[0]["id"]).last
            newest_coupon_instance = CouponInstance.create(coupon_id: newest_brand_coupon["id"], barcode: newest_brand_coupon["code"], user_id: session_id, amount: newest_brand_coupon["value"], logo: brand[0]["logo"], issue_date: newest_brand_coupon["created_at"], status: "pending", issue_date: DateTime.now, expiry_date: newest_brand_coupon["expiary_date"])
        end
        coupons = CouponInstance.where(user_id: session_id)
        payload = {
            url: url,
            recycle_status: recycle,
            recycle_status_prediction: recycle_prediction,
            user_id: session_id,
            itme_points: final_points,
            brand: name2,
            brand_prediction: brand_prediction,
            item_type: output1,
            item_type_prediction: output2,
            coupons: coupons
        }


        render json: payload


        File.delete('./tmp/storage/test.png')
    end 
end







