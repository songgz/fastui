class CreateFastuiMProperties < ActiveRecord::Migration
  def change
    create_table :fastui_m_properties do |t|
      t.references :m_entity
      t.string :title, :limit => 60, :null => false
      t.string :note, :default => ""
      t.string :name, :limit => 20, :null => false            #entity名

      t.references :refable, :polymorphic => true      #data_type, glossary, entity

      t.string :entity_kind, :limit => 20                     #sys,app
      t.integer :seq, :default => 0
      t.boolean :actived
      t.integer :org_id, :default => 0
      t.integer :createdby, :default => 0
      t.integer :updatedby, :default => 0
      t.string :help

      t.timestamps
    end
  end
end
