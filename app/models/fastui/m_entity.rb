module Fastui
  class MEntity < ActiveRecord::Base
    attr_accessible :id,:title ,:note ,:name,:access_level
    attr_accessible :entity_kind, :seq, :actived, :org_id, :createdby, :updatedby, :help
    has_many :m_properties, :class_name => 'Fastui::MProperty'
    has_many :refs, :as => :refable
    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :access_level, :class_name => 'Fastui::MGlossaryItem'
  end
end
