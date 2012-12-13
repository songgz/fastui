module Fastui
  class MColumn < MObject
    attr_accessible :id,:note, :title,:print_text, :name,:m_property,:m_property_id,:width,:m_tab,:m_tab_id
    attr_accessible :entity_kind,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq

    belongs_to :m_tab
    belongs_to :m_property,:class_name => 'Fastui::MProperty'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
