module Fastui
  class MList < MDatatype

    has_many :m_list_items, :class_name => 'Fastui::MListItem'
  end
end
