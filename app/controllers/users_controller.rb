class UsersController < ApplicationController

  def index
    @user = User.name
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
     if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up, #{@user.name}!"
      redirect_to root_path(@user)
     else
      render 'new'
     end
  end

  def edit
     @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    reset_session
    flash[:notice] = "So long, #{@user.name}!"
    redirect_to root_path
  end

  private def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

