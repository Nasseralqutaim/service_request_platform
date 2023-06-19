# db/seeds.rb

# Create some users
5.times do
  User.create(
    name: Faker::Name.name, 
    email: Faker::Name.first_name.downcase + "@example.com", 
    password: "password",
    password_confirmation: "password"
  )
end

# For each user, create some departments
User.all.each do |user|
  5.times do
    user.departments.create(
      name: Faker::Company.name
    )
  end
end

# For each department, create some tickets
Department.all.each do |department|
  5.times do
    department.tickets.create(
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 2),
      status: ["open", "in_progress", "closed"].sample,
      user: User.all.sample # Assign the ticket to a random user
    )
  end

  # For each user, create some requests
  User.all.each do |user|
    5.times do
      user.requests.create(
        description: Faker::Lorem.paragraph(sentence_count: 2),
        status: ["open", "in_progress", "closed"].sample,
        urgency_level: ["low", "medium", "high"].sample,
        expected_completion_date: Faker::Date.forward(days: 23),
        department: Department.all.sample # Assign the request to a random department
      )
    end
  end 
end
