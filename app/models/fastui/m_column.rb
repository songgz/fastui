module Fastui
  class MColumn < MObject
    attr_accessible :m_property,:m_property_id,:width,:m_tab,:m_tab_id

    belongs_to :m_tab
    belongs_to :m_property,:class_name => 'Fastui::MProperty'
  end
end
