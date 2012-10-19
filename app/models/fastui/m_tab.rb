module Fastui
  class MTab < ActiveRecord::Base
    attr_accessible :note, :title
    belongs_to :m_window
    has_many :m_fields, :dependent => :destroy
    has_many :m_columns, :dependent => :destroy
    has_many :m_actions, :dependent => :destroy
  end
end
