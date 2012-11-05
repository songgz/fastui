module Fastui
  class MDataType < ActiveRecord::Base
    has_many :m_properties, :as => :m_ref_type
  end
end
