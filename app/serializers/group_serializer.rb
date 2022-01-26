class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :users

  has_many :group_users
  has_many :users, through: :group_users
end
