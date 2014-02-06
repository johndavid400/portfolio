# This migration comes from refinery_clients (originally 1)
class CreateClientsClients < ActiveRecord::Migration

  def up
    create_table :refinery_clients do |t|
      t.string :title
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-clients"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/clients/clients"})
    end

    drop_table :refinery_clients

  end

end
