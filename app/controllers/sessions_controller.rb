class SessionsController < ApplicationController
	# login form
	def new
	end

	# log the person in
	def create
		user = User.find_by_email(params[:email])

		#if user is found and they typed in the right pw
		if user && user.authenticate(params[:password])

			# remember which user they are logged in as,
			# by storing in the session (cookies) 
			session[:user_id] = user.id
			redirect_to categories_path
		else
			redirect_to login_path
		end
	end

	# log the person out
	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end

end
