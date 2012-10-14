u = User.create!(email: "igor.cug@gmail.com", password: "123123", password_confirmation: "123123")
u.confirm!
u2 = User.create!(email: "test2@example.com", password: "123123", password_confirmation: "123123")
u2.confirm!

trips = (1..10).to_a.map do
  t = Trip.new
  t.driver = (rand(10) > 8) ? u2 : u
  t.starts_at = (rand(10) + 1).days.since
  t.save
  t
end

Proposal.create!(sender: u2, receiver: u, trip: trips.first)
