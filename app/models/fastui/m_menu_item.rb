module Fastui
  class MMenuItem < ActiveRecord::Base
    belongs_to :m_window
    attr_accessible :title
  end
end
