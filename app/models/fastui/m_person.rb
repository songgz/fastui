# encoding: utf-8
module Fastui
  class MPerson < MObject
    attr_accessible :login_name,:login_password
    has_many :m_relationships, :foreign_key => 'm_person_id', :class_name => 'Fastui::MRelationship'
    has_many :act_roles, :through => :m_relationships, :source => :m_role
    has_many :join_orgs, :through => :m_relationships, :source => :m_org
  end
end
