class MazeController < ApplicationController

	def home
	end

	def get_options
		render 'options'
	end

	def get_needs
		@need = Need.new
		@cares = Care.all
		render 'needs'
	end
end
