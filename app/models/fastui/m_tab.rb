# encoding: utf-8
module Fastui
  class MTab < ActiveRecord::Base
    attr_accessible :id,:read,:note, :title,:m_entity
    belongs_to :m_window
    belongs_to :m_entity
    has_many :m_fields, :dependent => :destroy
    has_many :m_columns, :dependent => :destroy
    has_many :m_actions, :dependent => :destroy
  end
end
