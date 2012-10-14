class Proposal < ActiveRecord::Base
  attr_accessible :comments_attributes, :sender, :receiver, :trip

  belongs_to :sender, class_name: :User
  belongs_to :receiver, class_name: :User
  belongs_to :trip
  has_many :comments, as: :owner

  validates_presence_of :sender
  validates_presence_of :receiver
  validates_presence_of :trip

  after_create :send_mail

  accepts_nested_attributes_for :comments

  def accept!
    update_column :state, 1

    if driver?
      trip.update_column :driver_id, sender_id
      trip.proposals.where { id != my { id } }.destroy_all
    else
      trip.passengers << sender
    end

    trip.update_attributes(seats_occupied: trip.seats_occupied.to_i + 1)
    ProposalMailer.acceptance(trip, sender).deliver
  end

  def cancel!
    update_column :state, 2

    unless driver?
      trip.passengers_trips.where(passenger_id: sender_id).destroy_all
    end

    trip.update_attributes(seats_occupied: trip.seats_occupied.to_i - 1)

    ProposalMailer.cancelation(trip, sender).deliver
  end


  def self.visible_for(user)
    joins { trip.passengers_trips.outer }.
      where { (sender_id == my { user.id }) | (trip.driver_id == my { user.id }) | ((trip.driver_id == nil) & (passengers_trips.passenger_id == my { user.id })) }
  end

private

  def driver?
    trip.driver_id.nil?
  end

  def send_mail
    ProposalMailer.new_proposal(trip, receiver).deliver
  end
end
