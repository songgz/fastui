class CreateFastuiMMenuItems < ActiveRecord::Migration
  def change
    create_table :fastui_m_menu_items do |t|
      t.string :title
      t.references :m_window

      t.timestamps
    end
    add_index :fastui_m_menu_items, :m_window_id
  end
end
