class User < ApplicationRecord
  has_secure_password

  validates :username, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :email, :presence => true, :uniqueness => {:case_sensitive => false}
end
