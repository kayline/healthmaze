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
end
