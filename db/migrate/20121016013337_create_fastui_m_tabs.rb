class CreateFastuiMTabs < ActiveRecord::Migration
  def change
    create_table :fastui_m_tabs do |t|
      t.string :title
      t.references :m_window
      t.string :model_class
      t.string :note
      t.string :help

      t.timestamps
    end
  end
end
