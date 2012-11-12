# encoding: utf-8
module Fastui
  class MGlossaryItem < ActiveRecord::Base
    attr_accessible :id,:title ,:note ,:name,:entity_kind,:actived, :org_id, :createdby, :updatedby,:help
    belongs_to :m_glossary, :class_name => 'Fastui::MGlossary'
  end
end
