class CreateFastuiMActions < ActiveRecord::Migration
  def change
    create_table :fastui_m_actions do |t|
      t.string :title
      t.string :event_type
      t.string :event_name
      t.references :m_tab

      t.timestamps
    end
    add_index :fastui_m_actions, :m_tab_id
  end
end
