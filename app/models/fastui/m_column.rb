module Fastui
  class MColumn < ActiveRecord::Base
    attr_accessible :note, :title, :name,:m_property,:width,:actived, :help, :createdby, :updatedby, :org_id
    belongs_to :m_tab
    belongs_to :m_property,:class_name => 'Fastui::MProperty'
    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
  end
end
