module Fastui
  class MField < ActiveRecord::Base
    attr_accessible :note, :title, :name,:m_property,:displayed,:read, :actived, :help, :createdby, :updatedby, :org_id
    belongs_to :m_tab
    belongs_to :m_property,:class_name => 'Fastui::MProperty'
  end
end
