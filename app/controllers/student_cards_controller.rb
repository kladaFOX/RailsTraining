class StudentCardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @card = StudentCard.new(card_params)
    if @card.save
      render json: @card, status: :created, location: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def new
  end

  def edit
  end

  def show
    @card = card_find
    render json: @card
  end

  def update
    @card = card_find
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @card = card_find
    @card.destroy
  end

  private
  def card_params
    params.require(:student_card).permit(:student_id, :faculty, :form_of_training, :date_of_enrollment, :date_of_issue, :card_valid_until, :card_number)
  end

  def card_find
    @card = StudentCard.find(params[:id])
  end
end
