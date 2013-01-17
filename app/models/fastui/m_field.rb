module Fastui
  class MField < MObject
    attr_accessible :m_property, :m_property_id, :is_display, :is_readonly, :m_tab, :m_tab_id,:default_logic

    belongs_to :m_tab, :class_name => 'Fastui::MTab'
    belongs_to :m_property, :class_name => 'Fastui::MProperty'

  end
end
