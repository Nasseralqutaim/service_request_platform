class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      # redirect to the request's show page
    else
      render 'new'
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      # redirect to the request's show page
    else
      render 'edit'
    end
  end

  def show
    @request = Request.find(params[:id])
    respond_to do |format|
      format.json {render json: @request}
    end
  end

  def index
    @requests = Request.all
    respond_to do |format|
      format.json { render json: @requests.as_json(only: [:id, :description, :status, :urgency_level, :expected_completion_date, :created_at, :updated_at]) }
    end

  end


    private

  def request_params
    params.require(:request).permit(:description, :status, :urgency_level, :expected_completion_date)
  end
end
