class CreateFastuiMTabs < ActiveRecord::Migration
  def change
    create_table :fastui_m_tabs do |t|
      t.references :m_window
      t.string :title, :limit => 60, :null => false
      t.string :note,:default => ''
      t.boolean :read,:default => false
      t.references :m_entity

      t.integer :entity_kind, :limit => 20                     #sys,app
      t.integer :seq, :default => 0
      t.boolean :actived,:default => true
      t.integer :org_id, :default => 0
      t.integer :createdby, :default => 0
      t.integer :updatedby, :default => 0
      t.string :help,:default => ''

      t.timestamps
    end
  end
end
