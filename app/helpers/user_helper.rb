module UserHelper
	def current_user
		User.first
	end
end