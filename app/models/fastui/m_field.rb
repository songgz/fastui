module Fastui
  class MField < ActiveRecord::Base
    attr_accessible :note, :title, :name,:m_property,:displayed,:read, :actived, :help, :createdby, :updatedby, :org_id
    belongs_to :m_tab
    belongs_to :m_property,:class_name => 'Fastui::MProperty'

    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :actived, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
