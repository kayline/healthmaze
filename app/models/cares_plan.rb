class CaresPlan < ActiveRecord::Base
	belongs_to :care 
	belongs_to :plan

	def coverage_multiplier
		self.cover_percent / 100.0
	end

	def payment_multiplier
		1 - self.coverage_multiplier
	end

end
