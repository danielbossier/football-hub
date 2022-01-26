class TeamUsersController < ApplicationController
  def index
    team_users = TeamUser.all
    render json: team_users
  end

  def create
    team_user = TeamUser.new(
      user_id: current_user.id,
      team_id: params[:team_id],
    )
    if team_user.save
      render json: team_user
    else
      render json: { errors: team_user.errors.full_messages }, status: 422
    end
  end

  def destroy
    team_users_id = params["id"]
    team_users = TeamUser.find_by(id: team_users_id)
    team_users.destroy
    render json: { message: "You have removed this team." }
  end
end
