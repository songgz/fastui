class CreateFastuiMTabs < ActiveRecord::Migration
  def change
    create_table :fastui_m_tabs do |t|
      t.references :m_window
      t.references :m_entity

      t.string :title, :limit => 60, :null => false
      t.string :name,:default => '', :limit => 60 # 系统编码
      t.string :print_text,:default => '',:limit => 60
      t.string :note  , :default => ''
      t.boolean :is_readonly, :default => false
      t.integer :included_tab_id,:default => 0
      t.string :grid_kind,:default => :grid  # :grid,:treegrid
      t.string :entity_kind,:default => '' #:sys,:app
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
