class LecturersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @lecturers = Lecturer.all
    render json: @lecturers
  end

  def create
    @lecturer = Lecturer.new(lecturer_params)
    if @lecturer.save
      render json: @lecturer, status: :created, location: @lecturer
    else
      render json: @lecturer.errors, status: :unprocessable_entity
    end
  end

  def new
  end

  def edit
  end

  def show
    render json: lecturer_find
  end

  def update
    @lecturer = lecturer_find
    if @lecturer.update(lecturer_params)
      render json: @lecturer
    else
      render json: @lecturer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    mark_find.destroy
  end

  private
  def lecturer_params
    params.require(:lecturer).permit(:subject_id, :last_name, :first_name, :patronymic)
  end

  def lecturer_find
    @lecturer = Lecturer.find(params[:id])
  end
end
