class CreateFastuiMEntities < ActiveRecord::Migration
  def change
    create_table :fastui_m_entities do |t|
      t.string :title, :limit => 60, :null => false
      t.string :print_text,:default => '',:limit => 60
      t.string :note, :default => ''
      t.string :name, :default => '', :limit => 60          #系统编码
      t.string :access_level , :default => ''        #:system,:org,:dept
      t.string :entity_kind, :default => ''                  #:sys,:app
      t.integer :seq, :default => 0
      t.boolean :actived, :default => true
      t.integer :org_id, :default => 0
      t.integer :createdby_id, :default => 0
      t.integer :updatedby_id, :default => 0
      t.string :help, :default => ''

      t.timestamps
    end
  end
end
