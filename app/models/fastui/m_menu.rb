module Fastui
  class MMenu < MObject

    has_many :m_menu_items, :class_name => 'Fastui::MMenuItem'

  end
end
