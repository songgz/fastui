# encoding: utf-8
module Fastui
  class MTab < ActiveRecord::Base
    attr_accessible :id, :title, :note, :m_window,:m_window_id,:m_entity, :m_entity_id, :read_id, :read
    attr_accessible :included_tab,:included_tab_id,:entity_kind_id, :entity_kind,:actived_id,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq

    belongs_to :m_window
    belongs_to :m_entity
    belongs_to :included_tab,:class_name => 'Fastui::MTab'
    has_many :m_fields, :dependent => :destroy
    has_many :m_columns, :dependent => :destroy
    has_many :m_actions, :dependent => :destroy
    belongs_to :read, :class_name => 'Fastui::MGlossaryItem'

    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :actived, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
