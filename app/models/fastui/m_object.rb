# encoding: utf-8
module Fastui
  class MObject < ActiveRecord::Base
    self.abstract_class = true

    attr_accessible :id, :name, :title, :print_text,:note, :entity_kind, :is_active, :seq, :help
    attr_accessible :createdbyorg_id,:createdbyorg,:createdby_id,:createdby,:updatedby_id,:updatedby

    belongs_to :createdbyorg, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'

    #before_create do |mo|
    #  mo.org_id = Env.ctx.get(:g_org_id) || mo.org_id
    #  mo.createdby_id = Env.ctx.get(:g_person_id) || mo.createdby_id
    #  mo.updatedby_id = Env.ctx.get(:g_person_id) || mo.updatedby_id
    #end
    #
    #before_update do |mo|
    #  mo.updatedby_id = Env.ctx.get(:g_person_id) || mo.updatedby_id
    #end

    #opts={name:'',members:'',extends:''}


    class << self
      #def window(opts)
      #  Fastui::View.instance.window(opts)
      #end
      #
      #def tab(opts)
      #  Fastui::View.instance.tab(opts)
      #end

      def ui(&block)
        Fastui::View.instance.config(&block) if block_given?
      end
    end

  end
end
