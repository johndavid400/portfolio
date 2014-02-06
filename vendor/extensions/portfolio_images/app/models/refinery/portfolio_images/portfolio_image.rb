module Refinery
  module PortfolioImages
    class PortfolioImage < Refinery::Core::BaseModel
      self.table_name = 'refinery_portfolio_images'

      attr_accessible :title, :image_id, :category_id, :client_id, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :client, :class_name => '::Refinery::Clients::Client'
      belongs_to :category, :class_name => '::Refinery::Categories::Category'
      belongs_to :image, :class_name => '::Refinery::Image'

      def thumb
        image.image.thumb("300x230#").url
      end

      def medium
        image.image.thumb("640x480").url
      end

      def large
        image.image.thumb("1024x768").url
      end

    end
  end
end
