# encoding: utf-8
module Fastui
  class MTab < MObject
    attr_accessible :m_window, :m_window_id, :m_entity, :m_entity_id, :ro
    attr_accessible :included_tab, :included_tab_id

    belongs_to :m_window, :class_name => 'Fastui::MWindow'
    belongs_to :m_entity, :class_name => 'Fastui::MEntity'
    belongs_to :included_tab, :class_name => 'Fastui::MTab'
    has_many :m_fields, :dependent => :destroy
    has_many :m_columns, :dependent => :destroy


  end
end
