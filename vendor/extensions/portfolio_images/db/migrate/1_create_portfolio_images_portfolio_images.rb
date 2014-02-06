class CreatePortfolioImagesPortfolioImages < ActiveRecord::Migration

  def up
    create_table :refinery_portfolio_images do |t|
      t.string :title
      t.integer :image_id
      t.integer :category_id
      t.integer :client_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-portfolio_images"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/portfolio_images/portfolio_images"})
    end

    drop_table :refinery_portfolio_images

  end

end
