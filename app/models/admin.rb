class Admin < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :email
end