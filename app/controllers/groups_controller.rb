class GroupsController < ApplicationController
  def index
    groups = Group.all
    render json: groups
  end

  def show
    group = Group.find_by(id: params[:id])
    render json: group
  end

  def create
    group = Group.new(
      name: params[:name],
    )
    group.save
    render json: group.as_json
  end
end
