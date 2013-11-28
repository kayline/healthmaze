class PlansUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :plan

	def calc_total_cost
		@needs = self.user.needs
		@plan = self.plan
		@needs.each do |n|
			puts "*****I'm processing some need costs**********"
			coverage_info = CaresPlan.where(:plan => @plan, :care => n.care).first
			annual_need_cost = n.cost * n.frequency
			if self.care_costs + annual_need_cost <= @plan.deductible
				net_need_cost = annual_need_cost
			elsif self.care_costs <= @plan.deductible
				uncovered_need_cost = [@plan.deductible-self.care_costs,0].max
				puts "$$$$The uncovered need cost is #{uncovered_need_cost}$$$$$$$"
				covered_amount = (annual_need_cost - uncovered_need_cost) * (coverage_info.cover_percent/100.0)
				puts "The covered amount is #{covered_amount}"
				net_need_cost = annual_need_cost - covered_amount
				puts "The net need cost is #{net_need_cost}"
			elsif self.care_costs + annual_need_cost <= @plan.annual_limit
				net_need_cost = annual_need_cost * (1-coverage_info.cover_percent)
			else
				net_need_cost = [@plan.annual_limit - self.care_costs, 0].max
			end
			self.care_costs += net_need_cost
		end
		self.total_cost = self.care_costs + @plan.cost * 12
		self.save
		return self.total_cost
	end

end