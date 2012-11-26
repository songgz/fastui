module Fastui
  class MMenuItem < ActiveRecord::Base
    attr_accessible :id, :name, :title, :note, :m_menu_id, :m_window_id, :parent_id
    attr_accessible :entity_kind_id, :entity_kind,:actived_id,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq

    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :actived, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'


    acts_as_nested_set
    belongs_to :m_window
    belongs_to :m_menu
  end
end
