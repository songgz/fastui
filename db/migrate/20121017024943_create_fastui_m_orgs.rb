class CreateFastuiMOrgs < ActiveRecord::Migration
  def change
    create_table :fastui_m_orgs do |t|
      t.string :title, :limit => 60, :null => false
      t.string :print_text,:default => '',:limit => 60
      t.string :note , :default => ''
      t.string :name,:default => '', :limit => 60
      t.string :type

      t.string :entity_kind, :default => ''                   #:sys,:app
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
