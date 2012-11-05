module Fastui
  class MEntity < ActiveRecord::Base
    has_many :m_properties, :class_name => 'Fastui::MProperty'
    has_many :m_properties, :as => :ref_type
  end
end