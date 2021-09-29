require_relative "../config/environment.rb"

Role.destroy_all
Audition.destroy_all

puts "Testing call back"
audition = Audition.create(actor: Faker::GreekPhilosophers.name, location: Faker::Space.planet, phone: Faker::Number.number(digits: 7), hired: false)
audition.call_back
puts audition.hired == true