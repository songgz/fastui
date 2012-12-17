module Fastui
  class MEntity < MObject
    attr_accessible :access_level

    has_many :m_properties, :class_name => 'Fastui::MProperty'

    def prop_by(name)
      self.m_properties.detect{|p| p.name == name}
    end


  end
end
