u = User.create!(email: "test@example.com", password: "123123", password_confirmation: "123123")
u.confirm!
