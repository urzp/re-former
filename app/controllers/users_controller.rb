class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param) #User.new(username: params[:username], email: params[:email], password: params[:password]) #User.new(user_param)
    print "====================================== CREATE ===================================================="
      if @user.save
        redirect_to new_user_path
      else
        render :new
      end
  end

  def edit
    print "====================================== EDIT ===================================================="
    @user = User.find(params[:id])
  end

  def update
    print "====================================== update ===================================================="
    @user = User.find(params[:id])
    @user.update_attributes(user_param)

  end

  private

  def user_param
    params.require(:user).permit(:username, :email, :password)
  end

end
