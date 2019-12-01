class User < ApplicationRecord
	has_secure_password

	validates :username, :email, uniqueness: true, presence: true
	validates :password, length: { in: 8..25 }
end