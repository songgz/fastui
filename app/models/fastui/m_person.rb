# encoding: utf-8
module Fastui
  class MPerson < MObject
    #attr_accessible :id, :name, :title,:print_text
    #attr_accessible :actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby

    has_many :m_relationships, :class_name => 'Fastui::MRelationship'
    has_many :m_roles, :through => :m_relationships
    has_many :m_orgs, :through => :m_relationships
    #belongs_to :org, :class_name => 'Fastui::MOrg'
    #belongs_to :createdby, :class_name => 'Fastui::MPerson'
    #belongs_to :updatedby, :class_name => 'Fastui::MPerson'

  end
end
