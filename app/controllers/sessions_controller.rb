class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      token = JWT.encode({ user_id: user.id }, 
      Rails.application.secrets.secret_key_base, 'HS256')
      render json: { jwt: token, user_id: user.id } 
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    redirect_to root_url
  end
end
