# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts('deleting all users...')
User.destroy_all
puts('done')

puts('creating users...')

User.create!(
  {
    first_name: 'Daniele',
    last_name: 'Trapani',
    email: 'daniele@email.com',
    password: '123456',
    password_confirmation: '123456',
    role: 'manager'
  }
)

employee = User.create!(
  {
    first_name: 'John',
    last_name: 'Doe',
    email: 'john@email.com',
    password: '123456',
    password_confirmation: '123456',
    role: 'employee'
  }
)
puts('done')

puts('creating entries...')
Entry.create!(company: 'Tesla', kwh: 12.5, startdate: Date.today, enddate: Date.today, user: employee)
Entry.create!(company: 'Ford', kwh: 18.5, startdate: Date.today, enddate: Date.today, user: employee)
Entry.create!(company: 'BMW', kwh: 200.3, startdate: Date.today, enddate: Date.today, user: employee)
puts('done')
