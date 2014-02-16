class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index,:edit,:update,:destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  before_action :new_user, only:[:new, :create]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def destroy
    user = User.find(params[:id])
    unless user.admin?
      user.destroy
      flash[:success] = "User deleted."
      redirect_to users_url
    else
      render "index"
      flash[:error] = "Cannot delete admin user."
    end
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Hi, #{@user.name.split[0]}! Welcome to Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Updated pofile!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  def user_params 
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
  def new_user
    if signed_in?
      redirect_to root_url, notice: "You must sign out to create new accounts."
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end
end
