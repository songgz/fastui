# encoding: utf-8
module Fastui
  class MPerson < MObject
    has_many :m_relationships, :class_name => 'Fastui::MRelationship'
    has_many :m_roles, :through => :m_relationships
    has_many :m_orgs, :through => :m_relationships
  end
end
