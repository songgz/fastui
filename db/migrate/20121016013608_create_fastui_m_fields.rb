class CreateFastuiMFields < ActiveRecord::Migration
  def change
    create_table :fastui_m_fields do |t|
      t.references :m_tab
      t.string :title, :limit => 60, :null => false
      t.string :note, :default => ''
      t.string :name, :limit => 20

      t.references :m_property
      t.integer :displayed , :default => 0
      t.integer :read , :default => 0

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
