if Rails.env.development?
  
  username = [950106, 931210]
  
  0.upto(10) do |index|
    user_id, password =  username[index] || Faker::Number.number(8),  username[index] || Faker::Internet.password
    user = User.new(customer_id: user_id, full_name: Faker::Name.name, email: Faker::Internet.email, 
                    phone: Faker::Number.number(8), rank: %w(sa usuario administrador).sample, 
                    first_time: [true, false].sample, password: password, 
                    password_confirmation: password )
  
    # Creating problems/incovenientes/request for this user
    if user.valid?
      user.save
      rank = (0..5).to_a
      0.upto(rank.sample) { user.problems.build(title: Faker::Name.title, description: Faker::Lorem.paragraph((10..70).to_a.sample)).save }
      0.upto(rank.sample) { user.incidents.build(title: Faker::Name.title, description: Faker::Lorem.paragraph((10..70).to_a.sample)).save }
      0.upto(rank.sample) { user.requests.build(title: Faker::Name.title, description: Faker::Lorem.paragraph((10..70).to_a.sample)).save }
    end
  end
end