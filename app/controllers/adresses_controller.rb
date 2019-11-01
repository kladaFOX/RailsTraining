class AdressesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if params.key?("university_id")
      @adresses = Adress.all.where(addressable_id: params[:university_id])
    else
      @adresses = Adress.all.where(addressable_id: params[:student_id])
    end
    render json: @adresses
  end

  def create
    @adress = Adress.new(adress_params)
    if @adress.save
      render json: @adress, status: :created, location: @adress
    else
      render json: @adress.errors, status: :unprocessable_entity
    end
  end

  def new
    @adress = Adress.new
  end

  def edit
  end

  def show
    @adress = Adress.find(params[:id])
    render json: @adress
  end

  def update
    @adress = adress_find
    if @adress.update(adress_params)
      render json: @adress
    else
      render json: @adress.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @adress = adress_find
    @adress.destroy
  end

  private
  def adress_params
    params.require(:adress).permit(:country, :region, :locality, :street, :house, :apartment, :addressable_id, :addressable_type)
  end
  def adress_find
    @adress = Adress.find(params[:id])
  end
end
