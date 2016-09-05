class UserController < ApplicationController
	def new
		@roles = UserRole.all

	end
	def show
		@users = User.all
		render 'show_users'
	end

	def create
		username                = params[:username]
		password                = params[:password]
		password_confirmation   = params[:password_confirmation]
		role_id                 = params[:user_role_id]

		# check if password & password confirmation
		if password == password_confirmation
			user_role_id = UserRole.find(role_id).id
			new_user = User.new(username: username, password: password,
			                    password_confirmation: password_confirmation,
			                    user_role_id: user_role_id)
			if new_user.valid?
				new_user.save
				redirect_to '/'
			else

			end
		else

		end
	end

	def delete
		selected_users = params[:users]
		selected_users.each do |user|
			selected_user = User.find_by_username(user)
			if user.blank?
				next
			elsif selected_user.user_role_id == UserRole.find_by_role('Administrator').id
				# user being deleted has admin rights
				# write code to verify deleting of admin account
			elsif user == current_user.username
				next # do not allow deleting of logged user
			else
				if selected_user.valid?
					selected_user.destroy
				end
			end
		end
		redirect_to '/' and return
	end
end
