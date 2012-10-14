u = User.create!(email: "test@example.com", password: "123123", password_confirmation: "123123")
u.confirm!
u2 = User.create!(email: "test2@example.com", password: "123123", password_confirmation: "123123")
u2.confirm!

t = Trip.create!(driver_id: u.id, starts_at: 1.day.since)

Proposal.create!(sender: u2, receiver: u, trip: t)
