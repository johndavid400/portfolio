
FactoryGirl.define do
  factory :client, :class => Refinery::Clients::Client do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

