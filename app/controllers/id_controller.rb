class IdController < ActionController::API

    def create
        chunk = {
            'inputs': [
              {
                'data': {
                  'image': {
                    'url': 'https://images-na.ssl-images-amazon.com/images/I/71S35muNXUL._SX425_.jpg'
                  }
                }
              }
            ]
       }
       body = chunk.to_json
       puts body

        conn = Faraday.new
        res = conn.post do |req|
            req.url 'https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/versions/aa7f35c01e0642fda5cf400f543e7c40/outputs'
            req.headers['Authorization'] = "Key #{ENV['CLARIFAI_API']}"
            req.headers['Content-Type'] = "application/json"
            req.body = body
        end
        puts json: res

        # @logged_item = LoggedItem.find(7)
        # @logged_item["item_type"] = recycle
        # @logged_item["item_type_prediction"] = recycle_prediction
        # @logged_item.save

    end
end