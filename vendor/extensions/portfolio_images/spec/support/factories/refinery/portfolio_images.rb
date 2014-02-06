
FactoryGirl.define do
  factory :portfolio_image, :class => Refinery::PortfolioImages::PortfolioImage do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

