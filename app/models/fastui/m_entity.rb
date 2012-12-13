module Fastui
  class MEntity < MObject
    #attr_accessible :id, :name, :title,:print_text, :note,:access_level, :entity_kind
    #attr_accessible :actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq
    attr_accessible :access_level

    has_many :m_properties, :class_name => 'Fastui::MProperty'
    #belongs_to :org, :class_name => 'Fastui::MOrg'
    #belongs_to :createdby, :class_name => 'Fastui::MPerson'
    #belongs_to :updatedby, :class_name => 'Fastui::MPerson'

  end
end
