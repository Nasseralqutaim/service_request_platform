class UsersController < ApplicationController
  
  def index
    @users = User.all

    respond_to do |format|
      format.json { render json: @users.as_json(only: [:id, :name, :email, :role, :created_at, :updated_at]) }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json:@user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity  
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end


