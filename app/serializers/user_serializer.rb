class UserSerializer < ApplicationSerializer
  attributes :id, :username, :email

  def id
    object.id.to_s
  end
end
