module Fastui
  class MOrg < MObject
    has_many :m_relationships, :class_name => 'Fastui::MRelationship'
    has_many :m_roles, :through => :m_relationships
    has_many :m_people, :through => :m_relationships
  end
end
