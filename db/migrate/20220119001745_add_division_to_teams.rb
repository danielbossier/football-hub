class AddDivisionToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :division, :string
  end
end
