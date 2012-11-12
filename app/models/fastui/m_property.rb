module Fastui
  class MProperty < ActiveRecord::Base
    attr_accessible :title ,:note ,:name,:ref,:entity_kind,:actived, :org_id, :createdby, :updatedby,:help
    belongs_to :m_entity, :class_name => 'Fastui::MEntity'
    belongs_to :ref, :polymorphic => true
  end
end
