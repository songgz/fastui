# encoding: utf-8
module Fastui
  class MWindow < ActiveRecord::Base
    attr_accessible :note, :title, :help, :active, :org_id, :createdby, :updatedby
    has_many :m_tabs, :dependent => :destroy
  end
end
