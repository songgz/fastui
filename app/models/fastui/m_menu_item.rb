require_dependency "awesome_nested_set"
module Fastui
  class MMenuItem < MObject
    attr_accessible :m_menu_id, :m_menu, :m_window_id, :m_window, :parent_id

    acts_as_nested_set
    belongs_to :m_window, :class_name => 'Fastui::MWindow'
    belongs_to :m_menu, :class_name => 'Fastui::MMenu'
  end
end
