# encoding: utf-8
module Fastui
  class MProperty < ActiveRecord::Base
    attr_accessible :m_entity, :title ,:note ,:name,:refable,:entity_kind,:actived, :org_id, :createdby, :updatedby,:help
    belongs_to :m_entity, :class_name => 'Fastui::MEntity'
    belongs_to :refable, :polymorphic => true

    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :actived, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
