module Fastui
  class MField < ActiveRecord::Base
    attr_accessible :m_tab, :id, :title, :note, :name, :m_property, :displayed, :read
    attr_accessible :entity_kind, :seq, :actived, :org_id, :createdby, :updatedby, :help
    belongs_to :m_tab
    belongs_to :m_property, :class_name => 'Fastui::MProperty'
    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
  end
end
