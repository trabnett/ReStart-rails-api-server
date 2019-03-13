# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "lucas", last_name: "cruz", email: "lucas", password: "asdf", password_confirmation: "asdf", points: 1020)

Brand.create(name: 'Starbucks', logo: 'https://www.universityvillageriverside.com/wp-content/uploads/2018/03/starbucks_logo.jpg', password: "asdf", password_confirmation: "asdf", email: 'starbucks@starbucks.com')
Brand.create(name: 'Dasani', logo: 'https://cdn.freebiesupply.com/logos/large/2x/dasani-logo-png-transparent.png', password: "asdf", password_confirmation: "asdf", email: 'dasani@dasani.com')
Brand.create(name: 'Coca-Cola', email: 'coke@coke.com', logo: 'http://twoparrot.com/wp-content/uploads/2011/10/Coke-Logo.jpg', password: "asdf", password_confirmation: "asdf")
Brand.create(name: 'Dr Pepper', email: 'drpepper@drpepper.com', logo: 'https://rmhckc.org/wp-content/uploads/2018/08/Dr-Pepper-Logo.jpg', password: "asdf", password_confirmation: "asdf")
Brand.create(name: 'Chiquita', email: 'chiquita@chipuita.com', logo: 'https://i.pinimg.com/originals/26/9c/1c/269c1cb9a8cabfe436a5325ab41131d5.jpg', password: "asdf", password_confirmation: "asdf")
Brand.create(name: 'Nestle', email: 'nestle@nestle.com', logo: 'http://www.morganwilliams.ca/wp-content/uploads/2014/04/nestle-logo.jpg', password: "asdf", password_confirmation: "asdf")
Brand.create(name: 'Lighthouse Labs', email: 'lighthouselabs@lighthouselabs.com', logo: 'https://media.glassdoor.com/sqll/1703209/lighthouse-labs-squarelogo-1499717044293.png', password: "asdf", password_confirmation: "asdf")
Brand.create(name: 'Duracell', email: 'duracell@duracell', logo: 'https://2.bp.blogspot.com/-O24JiqbqAnY/UhspDiewMUI/AAAAAAAAAlI/gbZrf9jXNOg/w1200-h630-p-k-no-nu/Logo+Duracell.JPG', password: "asdf", password_confirmation: "asdf")

BrandCoupon.create(brand_id: 4, code: "78907", expiary_date: "1-1-2020".to_date, item_number: 1, value: 1.5)
BrandCoupon.create(brand_id: 8, code: "61524", expiary_date: "1-1-2020".to_date, item_number: 2, value: 1.25)
BrandCoupon.create(brand_id: 3, code: "61523", expiary_date: "1-1-2020".to_date, item_number: 2, value: 0.75)
BrandCoupon.create(brand_id: 3, code: "61523", expiary_date: "1-1-2020".to_date, item_number: 3, value: 3)

CouponInstance.create(coupon_id: 1, logo:'https://rmhckc.org/wp-content/uploads/2018/08/Dr-Pepper-Logo.jpg', issue_date: "1-1-2012".to_date, status: "pending", date_used: "1-1-2019".to_date, barcode: "78907", user_id: 1, amount: 1.5, expiry_date: "1-1-2020".to_date)
CouponInstance.create(coupon_id: 2, logo: 'https://2.bp.blogspot.com/-O24JiqbqAnY/UhspDiewMUI/AAAAAAAAAlI/gbZrf9jXNOg/w1200-h630-p-k-no-nu/Logo+Duracell.JPG', issue_date: "1-1-2012".to_date, status: "pending", date_used: "1-1-2019".to_date, barcode: "61524 ", user_id: 1, amount: 1.25, expiry_date: "1-1-2020".to_date)
CouponInstance.create(coupon_id: 3, logo: 'https://www.coca-cola.ie/content/dam/journey/ie/en/hidden/History/heritage/596x334/the_logo_story_01122014_596x334.jpg', issue_date: "1-1-2012".to_date, status: "pending", date_used: "1-1-2019".to_date, barcode: "61524 ", user_id: 1, amount: 0.75, expiry_date: "1-1-2020".to_date)








