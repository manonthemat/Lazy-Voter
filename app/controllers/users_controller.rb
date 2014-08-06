class UsersController < ApplicationController
  def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
    @user = User.new
    end  

    def create
      @user = User.new(params.require(:user).permit(:username, :email, :dateofbirth))
      if @user.save
        redirect_to users_path
      else
        render 'new'
      end
    end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:username, :email, :dateofbirth))
        redirect_to users_path
      else
        render 'edit'
      end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_path
  end


end
