# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create :first_name => 'tim', :last_name => 'rabnett', :email => 'tim@tim', :password => 'asdf', :postcode => 'm6e1e7', :points => 0
User.create :first_name => 'lucas', :last_name => 'cruz', :email => 'lucas@lucas', :password => 'asdf', :postcode => 'a7d6e2', :points => 0
User.create :first_name => 'hilary', :last_name => 'watson', :email => 'hilary@hilary', :password => 'asdf', :postcode => 'l3r7n9', :points => 0

Point.create :name => 'recycling', :image => 'asdfa', :points => 80
Point.create :name => 'compost', :image => 'asdfa', :points => 100
Point.create :name => 'landfill', :image => 'asdfa', :points => 0

LoggedItem.create :user_id => 1, :photo => 'asdf', :item_type => 'tin can', :item_type_prediction => 77.7, :brand => 'coke', :brand_prediction => 83.3, :recycle_status => 'recycling', :recycle_status_prediction => 45.5, :current_item_type => 'tin can', :current_brand => 'coke', :current_recycle_status => 'recycling', :edited => false, :confirmed => true
LoggedItem.create :user_id => 2, :photo => 'asdf', :item_type => 'banana', :item_type_prediction => 99.999, :brand => 'chiquita', :brand_prediction => 55.5, :recycle_status => 'compost', :recycle_status_prediction => 99.9, :current_item_type => 'banana peel', :current_brand => 'chiquita', :current_recycle_status => 'compost', :edited => false, :confirmed => true
LoggedItem.create :user_id => 3, :photo => 'asdf', :item_type => 'sandwich', :item_type_prediction => 35.5, :brand => '', :brand_prediction => 0, :recycle_status => 'landfill', :recycle_status_prediction => 66.2, :current_item_type => 'hamburger', :current_brand => 'burger priest', :current_recycle_status => 'landfill', :edited => true, :confirmed => true

CouponInstance.create  :coupon_id => 1, :issue_date => 20180623, :status => 'pending', :barcode => 'asdf', :user_id => 1
CouponInstance.create  :coupon_id => 2, :issue_date => 20180712, :status => 'pending', :barcode => 'asdf', :user_id => 2
CouponInstance.create  :coupon_id => 3, :issue_date => 20180810, :status => 'used', :date_used => 20190401, :barcode => 'asdf', :user_id => 3

Brand.create :name => 'coke', :logo => 'asdf', :email => 'coke@coke', :password => 'asdf'
Brand.create :name => 'chiquita', :logo => 'asdf', :email => 'chiquita@chiquita', :password => 'asdf'
Brand.create :name => 'nike', :logo => 'asdf', :email => 'nike@nike', :password => 'asdf'

BrandCoupon.create :brand_id => 1, :code => 'asdf', :expiary_date => 20190422, :content => 'please enjoy this excellent coupon for coke products', :item_number => 1
BrandCoupon.create :brand_id => 2, :code => 'asdf', :expiary_date => 20190503, :content => 'save money on bananas courtesy of us!', :item_number => 2
BrandCoupon.create :brand_id => 1, :code => 'asdf', :expiary_date => 20190713, :content => 'this is a second coke coupon. We are giving away so much free stuff that Oprah is jealous!', :item_number => 1

Admin.create :email => 'admin@admin', :password => 'asdf'