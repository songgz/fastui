module Fastui
  class MGlossary < ActiveRecord::Base
    has_many :m_glossary_items, :class_name => 'Fastui::MGlossaryItem'
  end
end
