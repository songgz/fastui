class FastuiMComment < ActiveRecord::Migration
  def change
    create_table :fastui_m_comments do |t|
      t.string :title, :limit => 60
      t.string :note, :default => ''
      t.string :guide,:default => ''
      t.string :memo,:default => ''
      t.integer :total, :default => ''

      t.timestamps
    end

  end
end

