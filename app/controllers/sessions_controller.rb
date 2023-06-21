class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      token = JWT.encode({ user_id: @user.id }, 'your_secret_key') # This line is for example purposes, your implementation may differ
      render json: { jwt: token, user_id: @user.id }
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    
    redirect_to root_url
  end
end
