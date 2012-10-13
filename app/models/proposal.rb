class Proposal < ActiveRecord::Base
  attr_accessible :comments_attributes

  belongs_to :sender, class_name: :User
  belongs_to :receiver, class_name: :User
  belongs_to :trip
  has_many :comments, as: :owner

  validates_presence_of :sender
  validates_presence_of :receiver
  validates_presence_of :trip

  accepts_nested_attributes_for :comments
  attr_accessible :sender, :receiver, :trip

  def accept!
    update_column :state, 1
  end

  def cancel!
    update_column :state, 2
  end

  def self.visible_for(user)
    joins { trip.passengers_trips.outer }.
      where { (sender_id == my { user.id }) | (trip.driver_id == my { user.id }) | ((trip.driver_id == nil) & (passengers_trips.passenger_id == my { user.id })) }
  end
end
