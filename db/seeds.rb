
require 'faker'

#50.times do
#  users = User.create!(first_name: Faker::Name.first_name,
#  last_name: Faker::Name.unique.last_name,
#  description: Faker::Lorem.paragraph(sentence_count: 4),
#  email: Faker::Internet.unique.email
#   )
#end

#5.times do
#    events = Event.create!(start_date: Faker::Time.forward(days: 90, format: :short),
#    duration: Faker::Number.between(from: 15, to: 120),
#    title: Faker::Food.dish,
#    description: Faker::Restaurant.review,
#    price: Faker::Number.between(from: 5, to: 100),
#    location: Faker::Address.unique.city,
#    admin_id: User.pluck(:id).sample
#    )
#  end
  
  500.times do |n|
    attendance = Attendance.create!(
      user_id: User.pluck(:id).sample,
      event_id: Event.pluck(:id).sample,
      stripe_customer_id: 1 + n
    )
  end


