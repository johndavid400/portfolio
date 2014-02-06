module Refinery
  module PortfolioImages
    class PortfolioImage < Refinery::Core::BaseModel
      self.table_name = 'refinery_portfolio_images'

      attr_accessible :title, :image_id, :category_id, :client_id, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :client, :class_name => '::Refinery::Clients::Client'
      belongs_to :category, :class_name => '::Refinery::Categories::Category'
      belongs_to :image, :class_name => '::Refinery::Image'
    end
  end
end
