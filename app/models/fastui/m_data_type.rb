# encoding: utf-8
module Fastui
  class MDataType < ActiveRecord::Base
    attr_accessible :id, :title, :note, :name
    attr_accessible :entity_kind, :seq, :actived, :org_id, :createdby, :updatedby, :help
    has_many :refs, :as => :refable
    belongs_to :entity_kind, :class_name => 'Fastui::MGlossaryItem'
  end
end
