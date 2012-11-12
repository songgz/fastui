module Fastui
  class MColumn < ActiveRecord::Base
    attr_accessible :id,:note, :title, :name,:m_property,:width
    attr_accessible :entity_kind, :seq, :actived, :org_id, :createdby, :updatedby, :help
    belongs_to :m_tab
    belongs_to :m_property,:class_name => 'Fastui::MProperty'
    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
  end
end
