class MazeController < ApplicationController
	include UserHelper

	def home
	end

	def get_options
		render 'options'
	end

	def set_options
		# This is where we create a temp user, set as current, and create their plans_users based on eligible plans
	end

	def get_needs
		@need = Need.new
		@cares = Care.all
		render 'needs'
	end

	def set_needs
		current_user.reset_needs
		current_user.reset_costs
		@need = Need.new(need_params)
		@need.user = current_user
		if @need.save
			@plan_results = current_user.plans_users
			@plan_results.each do |pr|
				puts "*******Calculating total cost for plan #{pr.plan.id}"
				pr.calc_total_cost
				puts "*******Total cost is #{pr.total_cost}**********"
			end
			redirect_to plans_path
		else
			@errors = @need.errors.full_messages
			@cares = Care.all
			render 'needs'
		end
	end

	private
	def need_params
		params.require(:need).permit(:description, :frequency, :cost, :care_id)
	end
end
