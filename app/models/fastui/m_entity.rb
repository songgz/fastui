module Fastui
  class MEntity < ActiveRecord::Base
    attr_accessible :title ,:note ,:name,:access_level,:entity_kind,:actived, :org_id, :createdby, :updatedby,:help
    has_many :m_properties, :class_name => 'Fastui::MProperty'
    has_many :refs, :as => :refable
    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
  end
end
