class CreateFastuiMMenus < ActiveRecord::Migration
  def change
    create_table :fastui_m_menus do |t|
      t.string :title, :limit => 60, :null => false

      t.boolean :actived
      t.integer :org_id, :default => 0
      t.integer :createdby, :default => 0
      t.integer :updatedby, :default => 0

      t.timestamps
    end
  end
end
