class CreatePotentialClients < ActiveRecord::Migration
  def change
    create_table :potential_clients do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.integer :time_spent  # En minutes
      t.string :marketing_agent_name
      t.string :decision # Acceptation, attente, refus
      t.timestamps
    end
  end

end
