FactoryBot.define do
    factory :todo do
        email { Faker::Internet.email }
        f_name { Faker::Name.first_name }
        l_name { Faker::Name.last_name }
        is_admin { Faker::Boolean.boolean(true_ratio: 0.1) }
    end
end