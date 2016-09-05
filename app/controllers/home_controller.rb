class HomeController < ApplicationController
  def index
	  if !logged_in?
		  redirect_to '/login' and return
	  end

	  # get logged user user_role
	  @current_user_role = UserRole.find(current_user.user_role_id).role
  end
end
