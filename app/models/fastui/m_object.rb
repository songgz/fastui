module Fastui
  class MObject < ActiveRecord::Base
    attr_accessible :id, :name, :title, :print_text,:note, :entity_kind, :actived, :seq, :help
    attr_accessible :org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby
  end
end
