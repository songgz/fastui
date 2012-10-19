module Fastui
  class MColumn < ActiveRecord::Base
    belongs_to :m_tab
    attr_accessible :association, :association_name, :data_index, :sortable, :title, :width, :xtype
  end
end
