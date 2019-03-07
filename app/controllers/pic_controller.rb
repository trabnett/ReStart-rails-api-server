require "base64"

class PicController < ApplicationController

    def create


        encoded_string = Base64.strict_decode64(request.body.read)


        new_file = File.new('./tmp/storage/test.png', 'wb')
        new_file.write(encoded_string)
        new_file.close
        s3 = Aws::S3::Resource.new(access_key_id: ENV['S3_KEY'],
        secret_access_key: ENV['S3_SECRET_KEY'],
        region: ENV['S3_REGION'],)
        file = './tmp/storage/test.png'
       
        # counter = LoggedItem.count
        # @user = User(user_id)
        # name = "#{@user}/#{counter}"

        name = 'lucas.png'
        obj = s3.bucket(ENV['S3_BUCKET']).object(name)
        obj.upload_file(file)
 
        url = "https://s3-us-west-2.amazonaws.com/restartlighthouselabs/#{name}"

        puts url.to_s
        @logged_item = LoggedItem.new(user_id: 2)
        @logged_item["photo"] = url
        @logged_item.save

        res = {
            url: url,
            loggedItem_id: @logged_item.id}
        render json: res

        File.delete('./tmp/storage/test.png')
    end 
end
