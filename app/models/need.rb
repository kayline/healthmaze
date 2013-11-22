class Need < ActiveRecord::Base
	belongs_to :care
	belongs_to :user
end
