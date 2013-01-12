class CreateFastuiMRoles < ActiveRecord::Migration
  def change
    create_table :fastui_m_roles do |t|
      t.string :title, :limit => 60, :null => false
      t.string :name,:default => '', :limit => 60 # 系统标识
      t.string :note, :default => ''

      t.string :access_level , :default => ''        #:system,:org,:dept
      t.string :entity_kind, :default => '' #:sys,:app
      t.integer :seq, :default => 0
      t.boolean :is_active, :default => true
      t.integer :createdbyorg_id, :default => 0
      t.integer :createdby_id, :default => 0
      t.integer :updatedby_id, :default => 0
      t.string :help, :default => ''

      t.timestamps
    end
  end
end
