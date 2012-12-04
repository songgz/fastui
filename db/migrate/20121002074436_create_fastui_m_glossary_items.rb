class CreateFastuiMGlossaryItems < ActiveRecord::Migration
  def change
    create_table :fastui_m_glossary_items do |t|
      t.references :m_glossary
      t.string :title, :limit => 60, :null => false
      t.string :print_text,:default => '',:limit => 60
      t.string :note , :default => ''
      t.string :name,:default => '', :limit => 60

      t.integer :entity_kind_id, :default => 0 #:sys,:app
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
