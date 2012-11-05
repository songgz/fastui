module Fastui
  class MProperty < ActiveRecord::Base
    belongs_to :m_entity, :class_name => 'Fastui::MEntity'
    belongs_to :ref_type, :polymorphic => true
  end
end
