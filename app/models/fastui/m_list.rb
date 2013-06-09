# encoding: utf-8
module Fastui
  class MList < MObject

    has_many :m_list_items, :class_name => 'Fastui::MListItem'
  end
end
