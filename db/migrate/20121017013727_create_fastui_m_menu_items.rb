class CreateFastuiMMenuItems < ActiveRecord::Migration
  def change
    create_table :fastui_m_menu_items do |t|
      t.string :title, :limit => 60, :null => false
      t.references :m_window
      t.integer :actived,:default => 0
      t.integer :org_id, :default => 0
      t.integer :createdby, :default => 0
      t.integer :updatedby, :default => 0

      t.timestamps
    end
    add_index :fastui_m_menu_items, :m_window_id
  end
end
