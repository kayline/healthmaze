class User < ActiveRecord::Base
	has_many :plans_users
	has_many :needs

	def reset_costs
		self.plans_users.each do |pu|
			pu.total_cost = 0
			pu.care_costs = 0
			pu.save
		end
	end

	def reset_needs
		self.needs = []
		self.save
	end
end