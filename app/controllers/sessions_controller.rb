class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth['provider'], uid: auth['uid'].to_s).first
    user ? user.update_omniauth(auth) : user = User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end