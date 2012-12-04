module Fastui
  class MEntity < ActiveRecord::Base
    attr_accessible :id, :name, :title,:print_text, :access_level, :access_level_id, :note
    attr_accessible :entity_kind_id, :entity_kind,:actived_id,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq

    has_many :m_properties, :class_name => 'Fastui::MProperty'
    has_many :refs, :as => :refable
    belongs_to :access_level, :class_name => 'Fastui::MGlossaryItem'

    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :actived, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'

  end
end
