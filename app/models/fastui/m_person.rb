# encoding: utf-8
module Fastui
  class MPerson < MObject
    belongs_to :m_org, :class_name => 'Fastui::MOrg'
    belongs_to :m_role, :class_name => 'Fastui::MRole'
    has_many :m_relationships, :foreign_key => 'm_person_id', :class_name => 'Fastui::MRelationship'
    has_many :act_roles, :through => :m_relationships, :source => :m_role
    has_many :join_orgs, :through => :m_relationships, :source => :m_org
  end
end
