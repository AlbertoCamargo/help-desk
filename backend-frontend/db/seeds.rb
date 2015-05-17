if Rails.env.development?

  # Create Users
  username = [950106, 931210]
  
  0.upto(5) do |index|
    user_id = password =  username[index] || Faker::Number.number(8)
    user = User.new(customer_id: user_id, full_name: Faker::Name.name, email: Faker::Internet.email, 
                    phone: Faker::Number.number(8), rank: %w(sa usuario administrador).sample, 
                    first_time: false, password: user_id, password_confirmation: user_id )
    user.save if user.valid?
  end

  User.all.each do |user|
    # Creating problems/incovenientes/request for this user
    rank = (0..3).to_a
    0.upto(rank.sample) { user.problems.build(title: Faker::Name.title, description: Faker::Lorem.paragraph((10..70).to_a.sample)).save }
    0.upto(rank.sample) { user.incidents.build(title: Faker::Name.title, description: Faker::Lorem.paragraph((10..70).to_a.sample)).save }
    0.upto(rank.sample) { user.requests.build(title: Faker::Name.title, description: Faker::Lorem.paragraph((10..70).to_a.sample)).save }

    # Creating Comments to a problems/incovenientes/request
    rank = (0..5).to_a
    0.upto(rank.sample) { p User.where(rank: 'sa').sample.comments_problems.build(description: Faker::Lorem.paragraph((10..70).to_a), problem_id: Problem.all.sample.id).save }
    0.upto(rank.sample) { p User.where(rank: 'sa').sample.comments_incidents.build(description: Faker::Lorem.paragraph((10..70).to_a), incident_id: Incident.all.sample.id).save }
    0.upto(rank.sample) { p User.where(rank: 'sa').sample.comments_requests.build(description: Faker::Lorem.paragraph((10..70).to_a), request_id: Request.all.sample.id).save }
  end
=begin

<<<<<<< HEAD
  user = User.new(customer_id: 123456, full_name: Faker::Name.name, email: Faker::Internet.email, 
                  phone: '30123557', rank: 'sa', 
                  password: '123456', password_confirmation: '123456').save

=======
    user = User.new(customer_id: 123456, full_name: Faker::Name.name, email: Faker::Internet.email, 
                    phone: '30123557', rank: 'sa', 
                    first_time: false, password: '123456', password_confirmation: '123456').save
=end
>>>>>>> ebbe5097cff5490c4afc79467063249142304269
end 