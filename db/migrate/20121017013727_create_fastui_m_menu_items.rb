class CreateFastuiMMenuItems < ActiveRecord::Migration
  def change
    create_table :fastui_m_menu_items do |t|
      t.references :m_menu
      t.string :title, :limit => 60, :null => false
      t.string :print_text,:default => '',:limit => 60
      t.string :name,:default => '', :limit => 60
      t.string :window,:default => '', :limit => 60

      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth # this is optional.

      t.string :entity_kind, :default => '' #:sys,:app
      t.integer :seq, :default => 0
      t.boolean :is_active, :default => true
      t.string :note, :default => ''
      t.string :help, :default => ''
      t.integer :createdbyorg_id, :default => 0
      t.integer :createdby_id, :default => 0
      t.integer :updatedby_id, :default => 0

      t.timestamps
    end

  end
end
