class CaresPlan < ActiveRecord::Base
	belongs_to :care 
	belongs_to :plan
end
