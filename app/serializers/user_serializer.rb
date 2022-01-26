class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :teams

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :team_users
  has_many :teams, through: :team_users
end
