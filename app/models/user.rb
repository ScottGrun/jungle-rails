class User < ActiveRecord::Base
  validates_uniqueness_of :email, :case_sensitive => false
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
end
