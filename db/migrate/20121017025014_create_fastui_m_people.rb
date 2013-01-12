class CreateFastuiMPeople < ActiveRecord::Migration
  def change
    create_table :fastui_m_people do |t|
      t.string :title, :limit => 60, :null => false
      t.string :print_text,:default => '',:limit => 60
      t.string :name,:default => '',:limit => 60

      t.boolean :is_active, :default => true
      t.integer :createdbyorg_id, :default => 0
      t.integer :createdby_id, :default => 0
      t.integer :updatedby_id, :default => 0

      t.timestamps
    end
  end
end
