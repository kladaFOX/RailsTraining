class SubjectMarksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @marks = SubjectMark.all.where(student_id: params[:student_id])
    render json: @marks
  end

  def create
    @mark = SubjectMark.new(mark_params)
    if @mark.save
      render json: @mark, status: :created, location: @mark
    else
      render json: @mark.errors, status: :unprocessable_entity
    end
  end

  def new
  end

  def edit
  end

  def show
    @mark = mark_find
    render json: @mark
  end

  def update
    @mark = mark_find
    if @mark.update(mark_params)
      render json: @mark
    else
      render json: @mark.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @mark = mark_find
    @mark.destroy
  end

  private
  def mark_params
    params.require(:mark).permit(:student_id, :subject_id, :mark)
  end

  def mark_find
    @mark = SubjectMark.find(params[:id])
  end
end
