module Fastui
  class MOrg < ActiveRecord::Base
    attr_accessible :id, :name, :title,:print_text, :note
    attr_accessible  :entity_kind,:actived, :org_id, :org, :createdby_id, :createdby, :updatedby_id, :updatedby, :help, :seq

    has_many :m_relationships, :class_name => 'Fastui::MRelationship'
    has_many :m_roles, :through => :m_relationships
    has_many :m_people, :through => :m_relationships

    #belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'    :entity_kind_id,
    #belongs_to :actived, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'

  end
end
