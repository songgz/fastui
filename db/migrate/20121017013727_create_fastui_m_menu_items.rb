class CreateFastuiMMenuItems < ActiveRecord::Migration
  def change
    create_table :fastui_m_menu_items do |t|
      t.string :name, :limit => 20, :null => false
      t.string :title, :limit => 60, :null => false
      t.references :m_menu
      t.references :m_window

      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth # this is optional.

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
