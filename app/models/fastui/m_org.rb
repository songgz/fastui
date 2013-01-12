module Fastui
  class MOrg < MObject
    has_many :m_relationships, :foreign_key => 'm_org_id', :class_name => 'Fastui::MRelationship'
    has_many :act_roles, :through => :m_relationships, :source => :m_role
    has_many :actors, :through => :m_relationships, :source => :m_person

  end
end
