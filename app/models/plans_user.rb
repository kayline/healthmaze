class PlansUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :plan

	def calc_total_cost
		needs = self.user.needs
		needs.each do |need|
			self.calc_need_cost(need)
		end
		self.total_cost = self.care_costs + self.plan.annual_cost
		self.save
	end

	def calc_need_cost(need)
		coverage_info = CaresPlan.where(:plan => self.plan, :care => need.care).first
		annual_need_cost = need.cost * need.frequency
		if self.under_deductible?
			if self.under_deductible_tipping_point?(annual_need_cost)
				net_need_cost = annual_need_cost
			else
				covered_amount = (annual_need_cost - self.deductible_remaining) * coverage_info.coverage_multiplier
				net_need_cost = annual_need_cost - covered_amount
			end
		elsif self.under_annual_limit?
			if self.under_limit_tipping_point?(annual_need_cost)
				net_need_cost = annual_need_cost * coverage_info.payment_multiplier
			else
				net_need_cost = [self.plan.annual_limit - self.care_costs, 0].max
			end
		else
			net_need_cost += 0
		end
		self.care_costs += net_need_cost
	end

	def deductible_remaining
		[self.plan.deductible - self.care_costs, 0].max
	end

	def under_deductible?
		self.deductible_remaining > 0
	end

	def under_deductible_tipping_point?(new_cost)
		self.deductible_remaining > new_cost
	end

	def under_annual_limit?
		self.care_costs <= self.plan.annual_limit
	end

	def under_limit_tipping_point(new_cost)
		self.care_costs + annual_need_cost <= self.plan.annual_limit
	end

end