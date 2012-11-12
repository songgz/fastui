# encoding: utf-8
module Fastui
  class MTab < ActiveRecord::Base
    attr_accessible :id,:m_window, :title,:note,:read,:m_entity
    attr_accessible :entity_kind, :seq, :actived, :org_id, :createdby, :updatedby, :help
    belongs_to :m_window
    belongs_to :m_entity
    has_many :m_fields, :dependent => :destroy
    has_many :m_columns, :dependent => :destroy
    has_many :m_actions, :dependent => :destroy
    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
  end
end
