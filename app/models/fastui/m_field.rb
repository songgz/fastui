module Fastui
  class MField < ActiveRecord::Base
    attr_accessible :note, :m_tab, :title
    belongs_to :m_tab
  end
end
