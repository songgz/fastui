module Fastui
  class MProperty < ActiveRecord::Base
    belongs_to :m_entity, :class_name => 'Fastui::MEntity'
    belongs_to :m_ref_type, :polymorphic => :m_ref_type_able
  end
end
