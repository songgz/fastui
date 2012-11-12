# encoding: utf-8
module Fastui
  class MGlossary < ActiveRecord::Base
    attr_accessible :title ,:note ,:name,:entity_kind,:actived, :org_id, :createdby, :updatedby,:help
    has_many :m_glossary_items, :class_name => 'Fastui::MGlossaryItem'
    has_many :refs, :as => :ref
  end
end
