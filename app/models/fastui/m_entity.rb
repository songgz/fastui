module Fastui
  class MEntity < ActiveRecord::Base
    has_many :m_properties, :class_name => 'Fastui::MProperty'
  end
end
