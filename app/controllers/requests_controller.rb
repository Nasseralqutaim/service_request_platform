class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @user = User.find(params[:user_id])
    @request = @user.requests.new(request_params)
    if @request.save
      render json: @request, status: :created
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      render json: @request, status: :ok
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  def show
    @request = Request.find(params[:id])
    respond_to do |format|
      format.json {render json: @request}
    end
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @requests = @user.requests
    else
      @requests = Request.all
    end
    respond_to do |format|
      format.json { render json: @requests.as_json(only: [:id, :description, :status, :urgency_level, :expected_completion_date, :created_at, :updated_at]) }
    end
  end



    private

    def request_params
      params.require(:request).permit(:description, :status, :urgency_level, :expected_completion_date, :user_id, :department_id)
    end
    
end
