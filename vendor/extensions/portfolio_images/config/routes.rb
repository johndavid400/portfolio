Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :portfolio_images do
    resources :portfolio_images, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :portfolio_images, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :portfolio_images, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
