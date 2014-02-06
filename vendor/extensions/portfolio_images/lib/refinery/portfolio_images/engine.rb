module Refinery
  module PortfolioImages
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PortfolioImages

      engine_name :refinery_portfolio_images

      initializer "register refinerycms_portfolio_images plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "portfolio_images"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.portfolio_images_admin_portfolio_images_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/portfolio_images/portfolio_image'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PortfolioImages)
      end
    end
  end
end
