class CreateFastuiMTabs < ActiveRecord::Migration
  def change
    create_table :fastui_m_tabs do |t|
      t.references :m_window
      t.string :title, :limit => 60, :null => false
      t.string :note
      t.integer :read_id, :default => 0
      t.references :m_entity

      t.integer :entity_kind_id #:sys,:app
      t.integer :seq, :default => 0
      t.integer :actived_id, :default => 0
      t.integer :org_id, :default => 0
      t.integer :createdby_id, :default => 0
      t.integer :updatedby_id, :default => 0
      t.string :help
      t.timestamps
    end
  end
end
