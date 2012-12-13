# encoding: utf-8
module Fastui
  class MProperty < MObject
    attr_accessible :id, :name, :title,:print_text, :note,:external_key,:m_entity,:m_entity_id
    attr_accessible :m_datatype,:m_datatype_id,:entity_kind,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq

    belongs_to :m_entity, :class_name => 'Fastui::MEntity'
    belongs_to :m_datatype,:class_name => 'Fastui::MDatatype'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
