class Care < ActiveRecord::Base
	has_many :needs
	has_many :cares_plans
end
