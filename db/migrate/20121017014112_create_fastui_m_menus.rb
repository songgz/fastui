class CreateFastuiMMenus < ActiveRecord::Migration
  def change
    create_table :fastui_m_menus do |t|
      t.string :name,:default => '', :limit => 20
      t.string :title, :limit => 60, :null => false

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
