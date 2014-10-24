class CreatePathsClients < ActiveRecord::Migration
  def change

    create_table :clients_paths, id: false do |t|
      t.belongs_to :path
      t.belongs_to :client
    end

  end
end
