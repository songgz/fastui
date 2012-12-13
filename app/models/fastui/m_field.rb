module Fastui
  class MField < MObject
    #attr_accessible :id,:note, :title,:print_text, :name,:m_property,:m_property_id,:displayed,:ro,:id, :m_tab,:m_tab_id
    #attr_accessible :entity_kind,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq
    attr_accessible :m_property,:m_property_id,:displayed,:ro, :m_tab,:m_tab_id

    belongs_to :m_tab,:class_name => 'Fastui::MTab'
    belongs_to :m_property,:class_name => 'Fastui::MProperty'
    #belongs_to :org, :class_name => 'Fastui::MOrg'
    #belongs_to :createdby, :class_name => 'Fastui::MPerson'
    #belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
