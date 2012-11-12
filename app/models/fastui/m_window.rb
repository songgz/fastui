# encoding: utf-8
module Fastui
  class MWindow < ActiveRecord::Base
    attr_accessible :id, :note, :title, :kind
    attr_accessible :entity_kind, :seq, :actived, :org_id, :createdby, :updatedby, :help
    has_many :m_tabs, :dependent => :destroy
    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
  end
end
