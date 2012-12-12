module Fastui
  class MListItem < ActiveRecord::Base
    attr_accessible :id, :title, :print_text, :note, :name
    attr_accessible  :entity_kind,:seq, :actived, :org_id, :createdby, :createdby_id, :updatedby, :updatedby_id, :help

    belongs_to :m_list, :class_name => 'Fastui::MList'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
