# encoding: utf-8
module Fastui
  class MProperty < ActiveRecord::Base
    attr_accessible :m_entity,:id, :title, :note, :name, :refable
    attr_accessible :entity_kind, :seq, :actived, :org_id, :createdby, :updatedby, :help
    belongs_to :m_entity, :class_name => 'Fastui::MEntity'
    belongs_to :refable, :polymorphic => true
    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
  end
end
