FactoryBot.define do
  factory :employee do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    dob { Faker::Date.birthday(18, 65) }
    marital_status { Faker::Number.between(0, 4) }
    sin { Faker::Number.number(9) }
    hire_date { Faker::Date.backward(1000) }
    preferences { {
      first_option: Faker::Boolean.boolean,
      second_option: Faker::Boolean.boolean,
      third_option: Faker::Boolean.boolean
    } }
  end
end
