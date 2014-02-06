module Refinery
  module Clients
    class Client < Refinery::Core::BaseModel
      self.table_name = 'refinery_clients'

      attr_accessible :title, :description, :position

      has_many :images, :class_name => "::Refinery::PortfolioImages::PortfolioImage"

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
