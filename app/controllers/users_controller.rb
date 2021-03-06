class UsersController < ApplicationController
  
  def new #renders new template
     @user = User.new
  end    

  def create
  	@user = User.new(user_params)
  	if @user.save # validations
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		redirect_to signup_path
  	end
  end

  def show
    @user = current_user
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end