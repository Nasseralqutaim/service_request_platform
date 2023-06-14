class DepartmentsController < ApplicationController
  def new
    @department = Department.new
  end
  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @department = Department.find(params[:id])
  end
  def index
    @departments = Department.all
    render :index
  end

end
