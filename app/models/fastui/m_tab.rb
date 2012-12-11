# encoding: utf-8
module Fastui
  class MTab < ActiveRecord::Base
    attr_accessible :id, :title,:print_text,:name, :note, :m_window,:m_window_id,:m_entity, :m_entity_id, :ro
    attr_accessible :entity_kind,:included_tab,:included_tab_id,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq

    belongs_to :m_window,:class_name => 'Fastui::MWindow'
    belongs_to :m_entity,:class_name => 'Fastui::MEntity'
    belongs_to :included_tab,:class_name => 'Fastui::MTab'
    has_many :m_fields, :dependent => :destroy
    has_many :m_columns, :dependent => :destroy
    has_many :m_actions, :dependent => :destroy
    #belongs_to :read, :class_name => 'Fastui::MGlossaryItem'

    #belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'  :entity_kind_id,
    #belongs_to :actived, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
