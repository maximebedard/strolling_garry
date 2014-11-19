class CreatePathsPotentialClients < ActiveRecord::Migration
  def change
    create_table :paths_potential_clients, id: false do |t|
      t.belongs_to :path
      t.belongs_to :potential_client
    end
  end
end
