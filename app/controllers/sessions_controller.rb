class SessionsController < ApplicationController
  def new
    @user = User.new
    @is_login = true
  end

  def create
    u = User.where(email: params[:user][:email]).first
    #First make sure we actually found a user
    #Then, see if their password matches
    if u && u.authenticate(params[:user][:password])
      #Throw a cookie at the user that holds the logged in user ID
      session[:user_id] = u.id.to_s
      redirect_to ballots_path
    else
      redirect_to :back
    end
  end

  def destroy
    #Kill all of our cookies
    reset_session
    redirect_to users_path
  end
end