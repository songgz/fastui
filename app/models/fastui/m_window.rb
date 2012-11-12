# encoding: utf-8
module Fastui
  class MWindow < ActiveRecord::Base
    attr_accessible :note, :title, :help, :active, :org_id, :createdby, :updatedby
    has_many :m_tabs, :dependent => :destroy

    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :actived, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
