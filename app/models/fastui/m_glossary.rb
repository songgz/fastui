# encoding: utf-8
module Fastui
  class MGlossary < ActiveRecord::Base
    attr_accessible :title ,:note ,:name,:refable,:entity_kind,:actived, :org_id, :createdby, :updatedby,:help
    has_many :m_glossary_items, :class_name => 'Fastui::MGlossaryItem'
    has_many :refs, :as => :refable

    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :actived, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
