# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

password_digest = BCrypt::Password.create("password")
users =
  [
    { email_address: "michael@dundermifflin.co" },
    { email_address: "dwight@dundermifflin.co" },
    { email_address: "jim@dundermifflin.co" },
    { email_address: "pam@dundermifflin.co" },
    { email_address: "stanley@dundermifflin.co" },
    { email_address: "phyllis@dundermifflin.co" },
    { email_address: "angela@dundermifflin.co" },
    { email_address: "oscar@dundermifflin.co" },
    { email_address: "kevin@dundermifflin.co" },
    { email_address: "meredith@dundermifflin.co" },
    { email_address: "creed@dundermifflin.co" },
    { email_address: "kelly@dundermifflin.co" },
    { email_address: "ryan@dundermifflin.co" },
    { email_address: "toby@dundermifflin.co" }
  ].each do |attrs|
    User.create_with(password_digest:).find_or_create_by!(attrs)
  end
puts "Seeded #{users.length} users..."
