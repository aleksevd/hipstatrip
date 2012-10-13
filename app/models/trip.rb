class Trip < ActiveRecord::Base
  has_many :proposals

  attr_accessible :driver_id, :starts_at

  belongs_to :driver, class_name: "User"
  has_many :passengers, class_name: "User"

  def owner
    driver || passengers.first
  end
end
