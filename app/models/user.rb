class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_one :trip, as: :driver
  has_many :passengers_trips, as: :passenger
  has_many :trips, through: :passengers_trips
  has_many :comments

  def to_s
    email
  end
end
