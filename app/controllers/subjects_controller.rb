class SubjectsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @subjects = Subject.all
    render json: @subjects
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      render json: @subject, status: :created, location: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def show
    render json: subject_find
  end

  def update
    @subject = subject_find
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  def destroy
    subject_find.destroy
  end

  private
  def subject_params
    params.require(:subject).permit(:name)
  end
  def subject_find
    @subject = Subject.find(params[:id])
  end
end
