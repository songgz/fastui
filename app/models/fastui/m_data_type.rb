# encoding: utf-8
module Fastui
  class MDataType < ActiveRecord::Base
    attr_accessible :title ,:note ,:name,:entity_kind,:actived, :org_id, :createdby, :updatedby,:help
    has_many :refs, :as => :refable
    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
  end
end
