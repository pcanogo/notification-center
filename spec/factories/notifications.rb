FactoryBot.define do
    factory :todo do
        title { Faker::Book.title }
        body { Faker::Lorem.sentence }
    end
end