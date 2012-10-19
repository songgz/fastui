module Fastui
  class MAction < ActiveRecord::Base
    belongs_to :m_tab
    attr_accessible :event_name, :event_type, :title
  end
end
