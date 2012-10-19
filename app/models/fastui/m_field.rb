module Fastui
  class MField < ActiveRecord::Base
    attr_accessible :note, :m_tab, :title, :m_attr, :vfield, :active, :help, :createdby, :updatedby, :org_id
    belongs_to :m_tab
  end
end
