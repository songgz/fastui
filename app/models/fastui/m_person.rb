# encoding: utf-8
module Fastui
  class MPerson < MObject
    belongs_to :m_org, :class_name => 'Fastui::MOrg'
    has_many :m_relationships, :foreign_key => 'm_person_id', :class_name => 'Fastui::MRelationship'
    has_many :roles, :through => :m_relationships, :source => :m_role
    has_many :orgs, :through => :m_relationships, :source => :m_person
  end
end
