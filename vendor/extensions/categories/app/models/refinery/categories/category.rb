module Refinery
  module Categories
    class Category < Refinery::Core::BaseModel
      self.table_name = 'refinery_categories'

      attr_accessible :title, :position

      has_many :images, :class_name => "::Refinery::PortfolioImages::PortfolioImage"

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
