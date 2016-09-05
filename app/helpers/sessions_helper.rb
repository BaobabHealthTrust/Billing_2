module SessionsHelper

	# log in the authenticated user
	def log_in(user)
		session[:user_id] = user.id
	end

	# return the current logged_in user if available
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# return true if user is logged and false if not
	def logged_in?
		!current_user.nil?
	end

	# logout the current user
	def log_out
		session.delete(:user_id)
		@current_user = nil
		redirect_to '/' # to be changed to atleast root when root is configured in routes
	end
end
