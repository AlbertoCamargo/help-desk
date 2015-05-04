if Rails.env.development?
  # Users
  username = [950106, 931210]
  0.upto(15) do |index|
    user_id, password =  username[index] || Faker::Number.number(8),  username[index] || Faker::Internet.password
    user = User.new(customer_id: user_id, full_name: Faker::Name.name, email: Faker::Internet.email, 
                    phone: Faker::Number.number(8), rank: %w(sa usuario administrador).sample, 
                    first_time: [true, false].sample, password: password, 
                    password_confirmation: password )
    if user.valid?
      user.save
      user.problems.build(title: Faker::Name.title, description: Faker::Lorem.paragraph((10..70).to_a.sample))
      user.incidents.build(title: Faker::Name.title, description: Faker::Lorem.paragraph((10..70).to_a.sample))
      user.requests.build(title: Faker::Name.title, description: Faker::Lorem.paragraph((10..70).to_a.sample))
    end
  end
end