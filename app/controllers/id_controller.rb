class IdController < ActionController::API

    def create
        render json: {hello: "everyone"}
        tag_response = ClarifaiRuby::TagRequest.new.get("https://s3-us-west-2.amazonaws.com/restartlighthouselabs/running_shoe.jpeg")
        render json: tag_response
    end
end

# curl -X POST -H 'Authorization: 79939f11d7f342ec9a3d69d1417222b1' -H "Content-Type: application/json" \
#     -d ' \
#     { \
#       "inputs": [ \
#         { \
#           "data": { \
#             "image": { \
#               "url": "https://samples.clarifai.com/metro-north.jpg" \
#             } \
#           } \
#         }  \
#       ] \
#     }' \
# https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/versions/aa7f35c01e0642fda5cf400f543e7c40/outputs 