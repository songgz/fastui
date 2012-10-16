class CreateFastuiMWindows < ActiveRecord::Migration
  def change
    create_table :fastui_m_windows do |t|
      t.string :title
      t.string :note

      t.timestamps
    end
  end
end
