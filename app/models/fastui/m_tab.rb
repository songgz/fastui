# encoding: utf-8
module Fastui
  class MTab < ActiveRecord::Base
    attr_accessible :note, :title,:m_entity
    belongs_to :m_window
    belongs_to :m_entity
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
