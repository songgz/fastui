module Fastui
  class MMenu < ActiveRecord::Base
    attr_accessible :name, :title
    has_many :m_menu_items, :class_name => 'Fastui::MMenuItem'
  end
end
