class CouponInstancesController < ApplicationController
    def index
        res = CouponInstance.create(coupon_id: 4, logo: 'https://www.coca-cola.ie/content/dam/journey/ie/en/hidden/History/heritage/596x334/the_logo_story_01122014_596x334.jpg', issue_date: "1-1-2012".to_date, status: "pending", date_used: "1-1-2019".to_date, barcode: "61524 ", user_id: 1, amount: 4.75, expiry_date: "1-1-2020".to_date)
        render json: res
    end
    
end
