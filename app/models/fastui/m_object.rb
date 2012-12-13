module Fastui
  class MObject < ActiveRecord::Base
    attr_accessible :id, :name, :title, :print_text,:note, :entity_kind, :actived, :seq, :help
    attr_accessible :org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby

    before_create do |mo|
      mo.org_id = Env.ctx.get(:g_org_id) || mo.org_id
      mo.createdby_id = Env.ctx.get(:g_person_id) || mo.createdby_id
      mo.updatedby_id = Env.ctx.get(:g_person_id) || mo.updatedby_id
    end

    before_update do |mo|
      mo.updatedby_id = Env.ctx.get(:g_person_id) || mo.updatedby_id
    end

  end
end
