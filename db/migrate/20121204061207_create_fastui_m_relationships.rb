class CreateFastuiMRelationships < ActiveRecord::Migration
  def change
    create_table :fastui_m_relationships do |t|
      t.references :m_person
      t.references :m_org
      t.references :m_role


      t.string :entity_kind, :default => '' #:sys,:app
      t.integer :seq, :default => 0
      t.boolean :is_active, :default => true
      t.integer :org_id, :default => 0
      t.integer :createdby_id, :default => 0
      t.integer :updatedby_id, :default => 0
      t.string :help, :default => ''

      t.timestamps
    end
  end
end
