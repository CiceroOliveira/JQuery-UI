class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :client_id
      t.integer :prospect_id
      t.string :info

      t.timestamps
    end
    add_index :relationships, :client_id
    add_index :relationships, :prospect_id
    add_index :relationships, [:client_id, :prospect_id], :unique => true
  end

  def self.down
    drop_table :relationships
  end
end
