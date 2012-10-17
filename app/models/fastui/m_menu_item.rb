module Fastui
  class MMenuItem < ActiveRecord::Base
    acts_as_nested_set
    belongs_to :m_window
    attr_accessible :title
  end
end
