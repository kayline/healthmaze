class PlansController < ApplicationController
	include UserHelper

	def index
		@plan_results = current_user.plans_users
	end
end
