class TeamsController < ApplicationController
  def index
    url = "https://www.espn.com/nfl/standings"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    afc_teams = []
    nfc_teams = []
    afc_index = 2
    nfc_index = 82
    afc_wl_index = 0
    nfc_wl_index = 165
    team_listings = parsed_page.css("section")

    16.times do
      afc_team = {
        name: team_listings.css("a.AnchorLink")[afc_index].text,
        wins: team_listings.css("span.stat-cell")[afc_wl_index].text,
        losses: team_listings.css("span.stat-cell")[afc_wl_index + 1].text,
      }
      nfc_team = {
        name: team_listings.css("a.AnchorLink")[nfc_index].text,
        wins: team_listings.css("span.stat-cell")[nfc_wl_index].text,
        losses: team_listings.css("span.stat-cell")[nfc_wl_index + 1].text,
      }
      afc_teams << afc_team
      afc_index += 3
      nfc_teams << nfc_team
      nfc_index += 3
      afc_wl_index += 12
      nfc_wl_index += 12
    end
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
