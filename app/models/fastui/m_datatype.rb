module Fastui
  class MDatatype < MObject
    attr_accessible  :m_entity,:m_entity_id,:access_level,:filter

    belongs_to :m_entity,:class_name => 'Fastui::MEntity'

    def class_name
      self.class.to_s
    end

  end

end
