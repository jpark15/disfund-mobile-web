User.seed do |u|
  u.id    = 1
  u.email = "test@email.com"
  u.password = "testpass"
end

User.seed do |u|
  u.id    = 2
  u.email = "test2@email.com"
  u.password = "testpass"
end
