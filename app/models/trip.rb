class Trip < ActiveRecord::Base
  attr_accessible :driver_id, :starts_at
  
  belongs_to :driver, class_name: "User"
  has_many :passengers, class_name: "User"
end
