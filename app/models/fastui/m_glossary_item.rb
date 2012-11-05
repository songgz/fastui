module Fastui
  class MGlossaryItem < ActiveRecord::Base
    belongs_to :m_glossary, :class_name => 'Fastui::MGlossary'
  end
end
