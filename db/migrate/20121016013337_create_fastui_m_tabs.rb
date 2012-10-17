class CreateFastuiMTabs < ActiveRecord::Migration
  def change
    create_table :fastui_m_tabs do |t|
      t.string :title, :limit => 60, :null => false
      t.references :m_window
      t.string :model_class, :limit => 60
      t.string :note
      t.string :help
      t.boolean :actived
      t.integer :org_id, :default => 0
      t.integer :createdby, :default => 0
      t.integer :updatedby, :default => 0

      t.timestamps
    end
  end
end
