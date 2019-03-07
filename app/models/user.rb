require 'bcrypt'

class User < ApplicationRecord
    has_secure_password
    has_many :coupon_instances


    attr_accessor :password_digest
    

    validates_presence_of :email
    validates :email, uniqueness: true
  
end
