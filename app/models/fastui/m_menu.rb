module Fastui
  class MMenu < MObject
    attr_accessible :id,:name, :title ,:print_text
    attr_accessible :entity_kind,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq

    has_many :m_menu_items, :class_name => 'Fastui::MMenuItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
