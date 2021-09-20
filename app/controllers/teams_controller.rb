class TeamsController < ApplicationController
  def index
    teams = Team.all
    render json: teams.as_json
  end

  def create
    team = Team.new(
      name: params[:name],
      width: params[:width],
      height: params[:height],
    )
    Team.save
    render json: team.as_json
  end

  def show
    team = Team.find_by(id: params[:id])
    render json: team.as_json
  end

  def update
    team = Team.find_by(id: params[:id])
    team.name = params[:name] || team.name
    team.width = params[:width] || team.width
    team.height = params[:height] || team.height
    team.save
    render json: team.as_json
  end

  def destroy
    team = Team.find_by(id: params[:id])
    team.destroy
    render json: { message: "team successfully destroyed." }
  end
end
