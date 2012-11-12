class CreateFastuiMFields < ActiveRecord::Migration
  def change
    create_table :fastui_m_fields do |t|
      t.references :m_tab
      t.string :title, :limit => 60, :null => false
      t.string :note, :default => ""
      t.string :name, :limit => 20

      t.references :m_property
      t.boolean :displayed,:default => true
      t.boolean :read,:default => false

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
