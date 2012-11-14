class CreateFastuiMEntities < ActiveRecord::Migration
  def change
    create_table :fastui_m_entities do |t|
      t.string :title, :limit => 60, :null => false
      t.string :note, :default => ''
      t.string :name, :limit => 20, :null => false           #entity名
      t.integer :access_level_id , :default => 0        #:system,:org,:dept

      t.integer :entity_kind_id, :default => 0                  #:sys,:app
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
