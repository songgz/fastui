class CreateFastuiMRelationships < ActiveRecord::Migration
  def change
    create_table :fastui_m_relationships do |t|
      t.references :m_person
      t.references :m_org
      t.references :m_role
      t.boolean :actived

      t.integer :entity_kind_id, :default => 0 #:sys,:app
      t.integer :seq, :default => 0
      t.integer :actived_id, :default => 0
      t.integer :org_id, :default => 0
      t.integer :createdby_id, :default => 0
      t.integer :updatedby_id, :default => 0
      t.string :help, :default => ''

      t.timestamps
    end
  end
end
