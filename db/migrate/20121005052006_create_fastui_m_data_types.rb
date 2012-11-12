class CreateFastuiMDataTypes < ActiveRecord::Migration
  def change
    create_table :fastui_m_data_types do |t|
      t.string :title, :limit => 60, :null => false
      t.string :note
      t.string :name, :limit => 20, :null => false #entity名

      t.integer :entity_kind_id #:sys,:app
      t.integer :seq, :default => 0
      t.integer :actived_id
      t.integer :org_id, :default => 0
      t.integer :createdby_id, :default => 0
      t.integer :updatedby_id, :default => 0
      t.string :help
      t.timestamps
    end
  end
end
