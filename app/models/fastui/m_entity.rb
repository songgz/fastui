module Fastui
  class MEntity < MObject
    attr_accessible :access_level

    has_many :m_properties, :class_name => 'Fastui::MProperty'


  end
end
