# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  Employee.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    dob: Faker::Date.birthday(18, 65),
    marital_status: Faker::Number.between(0, 4),
    sin: Faker::Number.number(9),
    hire_date: Faker::Date.backward(1000),
    preferences: {
      first_option: Faker::Boolean.boolean,
      second_option: Faker::Boolean.boolean,
      third_option: Faker::Boolean.boolean
    }
  )
end
