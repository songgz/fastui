module Fastui
  class MMenuItem < ActiveRecord::Base
    attr_accessible :name, :title, :m_menu_id, :m_window_id, :parent_id
    attr_accessible :entity_kind_id, :entity_kind,:actived_id,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby,:help,:seq

    acts_as_nested_set
    belongs_to :m_window
    belongs_to :m_menu

  end
end
