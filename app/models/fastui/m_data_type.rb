module Fastui
  class MDataType < ActiveRecord::Base
    has_many :m_properties, :as => :ref_type
  end
end
