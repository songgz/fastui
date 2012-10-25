class CreateFastuiMColumns < ActiveRecord::Migration
  def change
    create_table :fastui_m_columns do |t|
      t.string :title
      t.string :data_index
      t.string :xtype
      t.boolean :sortable
      t.integer :width
      t.references :m_tab
      #t.string :association
      #t.string :association_name

      t.timestamps
    end
    add_index :fastui_m_columns, :m_tab_id
  end
end
