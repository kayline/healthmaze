class Plan < ActiveRecord::Base
	has_many :cares_plans
	has_many :plans_users
end
