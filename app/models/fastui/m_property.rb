# encoding: utf-8
module Fastui
  class MProperty < ActiveRecord::Base
    attr_accessible :m_entity, :title ,:note ,:name,:refable,:entity_kind,:actived, :org_id, :createdby, :updatedby,:help
    belongs_to :m_entity, :class_name => 'Fastui::MEntity'
    belongs_to :refable, :polymorphic => true
  end
end
