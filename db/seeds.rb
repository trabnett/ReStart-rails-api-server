# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Brand.create(name: 'Starbucks', logo: 'https://www.universityvillageriverside.com/wp-content/uploads/2018/03/starbucks_logo.jpg')
Brand.create(name: 'Dasani', logo: 'https://cdn.freebiesupply.com/logos/large/2x/dasani-logo-png-transparent.png')
Brand.create(name: 'Coca Cola', logo: 'https://www.coca-cola.ie/content/dam/journey/ie/en/hidden/History/heritage/596x334/the_logo_story_01122014_596x334.jpg')
Brand.create(name: 'Dr Pepper', logo: 'https://rmhckc.org/wp-content/uploads/2018/08/Dr-Pepper-Logo.jpg')
Brand.create(name: 'Chiquita', logo: 'https://i.pinimg.com/originals/26/9c/1c/269c1cb9a8cabfe436a5325ab41131d5.jpg')
Brand.create(name: 'Nestle', logo: 'http://www.morganwilliams.ca/wp-content/uploads/2014/04/nestle-logo.jpg')
Brand.create(name: 'Lighthouse Labs', logo: 'https://media.glassdoor.com/sqll/1703209/lighthouse-labs-squarelogo-1499717044293.png')
Brand.create(name: 'Duracell', logo: 'https://2.bp.blogspot.com/-O24JiqbqAnY/UhspDiewMUI/AAAAAAAAAlI/gbZrf9jXNOg/w1200-h630-p-k-no-nu/Logo+Duracell.JPG')

BrandCoupon.create(brand_id: 4, code: "78907", expiary_date: "1-1-2020".to_date, content: "thank you for drinking so much Dr. Pepper! Have this coupon for $1 off your next purchase. Also, you should see a doctor. This beverage is terrible for you.", item_number: 1)
BrandCoupon.create(brand_id: 8, code: "61524", expiary_date: "1-1-2020".to_date, content: "You just earned valuabe Duracell dollers! Way to go!", item_number: 2)








