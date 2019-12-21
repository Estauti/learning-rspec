FactoryBot.define do
  factory :weapon do
    name { FFaker::Product.product_name }
    description { FFaker::Lorem.sentence }
    power_base { rand(1..5000) }
    power_step { rand(1..100) }
    level { rand(1..10) }
  end
end