# encoding: utf-8
module Fastui
  class MPerson < ActiveRecord::Base
    attr_accessible :id, :name, :title,:print_text
    attr_accessible :actived_id,:actived,:org_id,:org,:createdby_id,:createdby,:updatedby_id,:updatedby

    belongs_to :actived, :class_name => 'Fastui::MGlossaryItem'
    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end
end
