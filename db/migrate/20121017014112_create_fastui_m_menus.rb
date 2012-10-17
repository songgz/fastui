class CreateFastuiMMenus < ActiveRecord::Migration
  def change
    create_table :fastui_m_menus do |t|
      t.string :title

      t.timestamps
    end
  end
end
