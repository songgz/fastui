class CreateFastuiMRoles < ActiveRecord::Migration
  def change
    create_table :fastui_m_roles do |t|
      t.string :title, :limit => 60, :null => false
      t.string :print_text,:default => '',:limit => 60
      t.string :name, :default => '', :limit => 60 # 系统标识
      t.string :access_level , :default => 'org'        #:system,:org,:dept
      t.string :type

      t.string :entity_kind, :default => 'app' #:sys,:app
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
