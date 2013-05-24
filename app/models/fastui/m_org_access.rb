# encoding: utf-8
module Fastui
  class MOrgAccess < MObject
    attr_accessible :m_dept_id,:m_org_id,:m_role_id

    belongs_to :m_role, :class_name => 'Fastui::MRole'
    belongs_to :m_dept, :class_name => 'Fastui::MDept'
    belongs_to :m_org, :class_name => 'Fastui::MOrg'
  end
end
