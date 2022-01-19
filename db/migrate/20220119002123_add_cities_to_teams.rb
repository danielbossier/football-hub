class AddCitiesToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :city, :string
  end
end
