class CreateFastuiMFields < ActiveRecord::Migration
  def change
    create_table :fastui_m_fields do |t|
      t.string :title
      t.references :m_tab
      t.string :m_attr
      t.string :vfield
      t.string :note
      t.string :help

      t.timestamps
    end
  end
end
