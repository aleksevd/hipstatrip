class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Proposal, sender_id: user.id
    can :read, Proposal, receiver_id: user.id
    #can :read, Proposal, trip: { driver_id: user.id }
    #can :read, Proposal, Proposal.includes(trip: :passengers_trips).each do |proposal|
    #                       proposal.trip.driver_id.nil? && proposal.trip.passengers_trips.first.passenger_id == user.id
    #                     end

    can :manage, Trip, trip: { driver_id: user.id }
    can :manage, Trip, Trip.passenger_type.each do |trip|
                         passenger_id = trip.passengers_trips.first.try(:passenger_id)
                         passenger_id.present? && (passenger_id == user.id) && (trip.driver_id.nil?)
                       end

    # FIXME doesn't work, seems to be a bug in cancan
    #can :read, Proposal, trip: { driver_id: nil, passengers_trips: { passenger_id: user.id } }
  end
end
