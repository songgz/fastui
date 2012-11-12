module Fastui
  class MAction < ActiveRecord::Base
    attr_accessible :id,:event_name, :event_type, :title
    belongs_to :m_tab
  end
end
