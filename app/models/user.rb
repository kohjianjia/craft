class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  has_many :crafts, dependent: :destroy
end
