# encoding: utf-8
module Fastui
  class MWindow < MObject
    #attr_accessible :id, :title,:print_text, :name,:note
    #attr_accessible :entity_kind,:window_kind,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq
    attr_accessible :window_kind

    has_many :m_tabs, :dependent => :destroy
    #belongs_to :org, :class_name => 'Fastui::MOrg'
    #belongs_to :createdby, :class_name => 'Fastui::MPerson'
    #belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
