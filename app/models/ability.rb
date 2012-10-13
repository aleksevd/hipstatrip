class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Proposal, sender_id: user.id
    can :read, Proposal, trip: { driver_id: user.id }
    # FIXME doesn't work, seems to be a bug in cancan
    #can :read, Proposal, trip: { driver_id: nil, passengers_trips: { passenger_id: user.id } }
  end
end
