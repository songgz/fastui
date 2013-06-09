class CreateFastuiMAclEntries < ActiveRecord::Migration
  def change
    create_table :fastui_m_acl_entries do |t|
      t.string :aco_type, :limit =>60, :default => ''
      t.integer :aco_id, :default => 0
      t.string :aro_type, :limit =>60, :default => ''
      t.integer :aro_id, :default => 0
      t.string :permit, :limit =>60, :default => ''  #allow deny

      t.string :access_level , :default => ''        #:system,:org,:dept
      t.string :entity_kind, :default => ''                  #:sys,:app
      t.integer :seq, :default => 0
      t.boolean :actived, :default => true
      t.integer :createdbyorg_id, :default => 0
      t.integer :createdby_id, :default => 0
      t.integer :updatedby_id, :default => 0

      t.timestamps
    end
  end
end
