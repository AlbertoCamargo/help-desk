if Rails.env.development?
  # Users
  username = [950106, 931210]
  1.upto(15) do |index|
    user_id, password =  username[index] || Faker::Number.number(8),  username[index] || Faker::Internet.password
    user = User.new(customer_id: user_id, full_name: Faker::Name.name, email: Faker::Internet.email, 
                    phone: Faker::Number.number(8), rank: %w(sa usuario administrador).sample, 
                    first_time: [true, false].sample, password: password, 
                    password_confirmation: password )
    user.save if user.valid?
    user.problems.build(title: Faker::Name.title, description: )
    user.incidents.build()
    user.requests.build()
  end
end