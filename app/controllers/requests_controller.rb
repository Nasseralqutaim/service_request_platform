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
  end

  def index
    @requests = Request.all
  end

    private

  def request_params
    params.require(:request).permit(:description, :status, :urgency_level, :expected_completion_date)
  end
end
