# encoding: utf-8
require_dependency "awesome_nested_set"
module Fastui
  class MOrg < MObject
    attr_accessible :parent_id, :parent
    acts_as_nested_set

    has_many :m_relationships, :foreign_key => 'm_org_id', :class_name => 'Fastui::MRelationship'
    has_many :act_roles, :through => :m_relationships, :source => :m_role
    has_many :actors, :through => :m_relationships, :source => :m_person

    belongs_to :parent, :class_name => 'Fastui::MOrg'


  end
end
