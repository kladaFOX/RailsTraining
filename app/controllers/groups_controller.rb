class GroupsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @groups = Group.all
    render json: @groups
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def show
    @group = Group.find(params[:id])
    render json: @group
  end

  def update
    @group = group_find
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @group = group_find
    @group.destroy
  end

  private
  def group_params
    params.require(:group).permit(:number, :session_id, :university_id)
  end
  def group_find
    @group = Group.find(params[:id])
  end
end
