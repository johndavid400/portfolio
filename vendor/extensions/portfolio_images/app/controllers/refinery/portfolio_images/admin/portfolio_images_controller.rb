module Refinery
  module PortfolioImages
    module Admin
      class PortfolioImagesController < ::Refinery::AdminController

        crudify :'refinery/portfolio_images/portfolio_image',
                :xhr_paging => true

      end
    end
  end
end
