# encoding: utf-8
module Fastui
  class MProperty < MObject
    attr_accessible :external_key, :m_entity, :m_entity_id
    attr_accessible :m_datatype, :m_datatype_id

    belongs_to :m_entity, :class_name => 'Fastui::MEntity'
    belongs_to :m_datatype, :class_name => 'Fastui::MDatatype'

  end
end
