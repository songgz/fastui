module Fastui
  class MOrg < MObject
    has_many :m_relationships, :foreign_key => 'm_org_id', :class_name => 'Fastui::MRelationship'
    has_many :roles, :through => :m_relationships, :source => :m_role
    has_many :people, :through => :m_relationships, :source => :m_person
    has_many :m_people, :foreign_key => 'm_org_id', :class_name => 'Fastui::MPerson'

  end
end
