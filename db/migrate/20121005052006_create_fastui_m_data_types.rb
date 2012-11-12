class CreateFastuiMDataTypes < ActiveRecord::Migration
  def change
    create_table :fastui_m_data_types do |t|
      t.string :title, :limit => 60, :null => false
      t.string :note,:default => ''
      t.string :name, :limit => 20, :null => false           #entity名

      t.string :entity_kind, :limit => 20                     #sys,app
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
