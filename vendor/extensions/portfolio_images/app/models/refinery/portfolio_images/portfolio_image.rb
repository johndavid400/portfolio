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
        # image.image.thumb("300x230#").url
        File.open(File.join(Rails.root, "public", "assets", "thumbs", image.image.name))
        ["thumbs", image.image.name].join("/")
      rescue
        image.image.thumb("300x230#").to_file(Rails.root.join("public", "assets", "thumbs", image.image.name))
        ["thumbs", image.image.name].join("/")
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
