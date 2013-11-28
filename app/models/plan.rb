class Plan < ActiveRecord::Base
	has_many :cares_plans
	has_many :plans_users

	def annual_cost
		self.cost * 12
	end

end
