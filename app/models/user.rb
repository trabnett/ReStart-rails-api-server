class User < ApplicationRecord
    has_many :coupon_instances
    has_many :logged_items
    has_secure_password
    validates :email, presence: true, uniqueness: true

    require 'bcrypt'

    # users.password_hash in the database is a :string
    include BCrypt

    def password
        @password ||= Password.new(password_digest)
    end

    def password=(new_password)
        @password = Password.create(new_password)
        self.password_digest = @password
    end



end
