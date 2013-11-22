class User < ActiveRecord::Base
	has_many :plans_users
	has_many :needs
end