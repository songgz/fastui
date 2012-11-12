class CreateFastuiMWindows < ActiveRecord::Migration
  def change
    create_table :fastui_m_windows do |t|
      t.string :title, :limit => 60, :null => false
      t.string :note,:default => ''
      t.integer :kind                                 #maintain, transaction or query

      t.string :entity_kind                      #sys,app
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
