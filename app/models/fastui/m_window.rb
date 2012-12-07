# encoding: utf-8
module Fastui
  class MWindow < ActiveRecord::Base
    attr_accessible :id, :title,:print_text, :name,:note
    attr_accessible :entity_kind,:window_kind,:actived_id,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq

    has_many :m_tabs, :dependent => :destroy
    #belongs_to :window_kind, :class_name => 'Fastui::MGlossaryItem' , :window_kind_id,

    #belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem' :entity_kind_id,
    belongs_to :actived, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
