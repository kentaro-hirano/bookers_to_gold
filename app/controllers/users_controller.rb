class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.new
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "User was successfully updated."
    redirect_to user_path(@user)
    else
      @users = User.all  
      render :edit
    end
  end

  private
  def user_params
   params.require(:user).permit(:name, :profile_image, :introduction, :postcode, :prefecture_name, :address_city, :address_street, :address_building)
  end
  
end

