class UniversitiesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @universities = University.all
    render json: @universities
  end

  def create
    @university = University.new(university_params)
    if @university.save
      render json: @university, status: :created, location: @university
    else
      render json: @university.errors, status: :unprocessable_entity
    end
  end

  def new
    @university = University.new
  end

  def edit
  end

  def show
    @university = University.find(params[:id])
    render json: @university
  end

  def update
    @university = university_find
    if @university.update(university_params)
      render json: @university
    else
      render json: @university.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @university = university_find
    @university.destroy
  end

  private
  def university_params
    params.require(:university).permit(:name)
  end
  def university_find
    @university = University.find(params[:id])
  end
end
