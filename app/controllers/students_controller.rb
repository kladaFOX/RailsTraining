class StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @students = Student.all.where(group_id: params[:group_id])
    render json: @students
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def new
  end

  def edit
  end

  def show
    @student = student_find
    render json: @student
  end

  def update
    @student = student_find
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student = student_find
    @student.destroy
  end

  def average_mark
    @average = SubjectMark.all.where(student_id: params[:id]).average(:mark)
    render json: @average
  end

  private
  def student_params
    params.require(:student).permit(:last_name, :first_name, :patronymic, :group_id, :headman_id)
  end

  def student_find
    @student = Student.find(params[:id])
  end
end
