# encoding: utf-8
module Fastui
  class MWindow < ActiveRecord::Base
    attr_accessible :id,:note, :title,:kind,:entity_kind,:seq,:actived,:org_id, :createdby, :updatedby,:help
    has_many :m_tabs, :dependent => :destroy
  end
end
