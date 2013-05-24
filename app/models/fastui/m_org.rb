# encoding: utf-8
require_dependency "awesome_nested_set"
module Fastui
  class MOrg < MObject
    acts_as_nested_set

    attr_accessible :parent_id, :parent

    has_many :m_org_accesses, :foreign_key => 'm_org_id', :class_name => 'Fastui::MOrgAccess'
    has_many :m_roles, :through => :m_org_accesses, :source => :m_role

    belongs_to :parent, :class_name => 'Fastui::MOrg'
    alias :leaf :leaf?
    alias :expanded :child?


  end
end
