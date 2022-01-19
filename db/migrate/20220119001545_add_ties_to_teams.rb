class AddTiesToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :ties, :string
  end
end
