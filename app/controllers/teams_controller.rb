class TeamsController < ApplicationController
  #def display
  #   url = "https://www.espn.com/nfl/standings"
  #   unparsed_page = HTTParty.get(url)
  #   parsed_page = Nokogiri::HTML(unparsed_page)
  #   afc_teams = []
  #   nfc_teams = []
  #   nfl_teams = []
  #   afc_index = 9
  #   nfc_index = 89
  #   afc_wl_index = 0
  #   nfc_wl_index = 192
  #   afc_team_index = 1
  #   nfc_team_index = 17
  #   team_listings = parsed_page.css("section")

  #   16.times do
  #     afc_team = {
  #       name: team_listings.css("a.AnchorLink")[afc_index].text,
  #       wins: team_listings.css("span.stat-cell")[afc_wl_index].text,
  #       losses: team_listings.css("span.stat-cell")[afc_wl_index + 1].text,
  #     }
  #     teams = Team.all
  #     team = teams.find(afc_team_index)
  #     team.name = afc_team[:name] || team.name
  #     team.wins = afc_team[:wins] || team.wins
  #     team.losses = afc_team[:losses] || team.losses
  #     team.save
  #     afc_teams << afc_team
  #     afc_index += 3
  #     afc_wl_index += 12
  #     afc_team_index += 1
  #   end

  #   16.times do
  #     nfc_team = {
  #       name: team_listings.css("a.AnchorLink")[nfc_index].text,
  #       wins: team_listings.css("span.stat-cell")[nfc_wl_index].text,
  #       losses: team_listings.css("span.stat-cell")[nfc_wl_index + 1].text,
  #     }
  #     teams = Team.all
  #     team = teams.find(nfc_team_index)
  #     team.name = nfc_team[:name] || team.name
  #     team.wins = nfc_team[:wins] || team.wins
  #     team.losses = nfc_team[:losses] || team.losses
  #     team.save
  #     nfc_teams << nfc_team
  #     nfc_index += 3
  #     nfc_wl_index += 12
  #     nfc_team_index += 1
  #   end
  #   nfl_teams << afc_teams
  #   nfl_teams << nfc_teams
  #   render json: nfl_teams
  #end

  def index
    teams = Team.all
    render json: teams.as_json
  end

  def create
    team = Team.new(
      name: params[:name],
      wins: params[:wins],
      losses: params[:losses],
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
    team.wins = params[:wins] || team.wins
    team.losses = params[:losses] || team.losses
    team.save
    render json: team.as_json
  end

  def destroy
    team = Team.find_by(id: params[:id])
    team.destroy
    render json: { message: "team successfully destroyed." }
  end
end
