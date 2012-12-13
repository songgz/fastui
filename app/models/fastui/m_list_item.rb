module Fastui
  class MListItem < MObject
      attr_accessible :m_list,:m_list_id

    belongs_to :m_list, :class_name => 'Fastui::MList'

  end
end
