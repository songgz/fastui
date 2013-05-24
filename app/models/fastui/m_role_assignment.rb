# encoding: utf-8
module Fastui
  class MRoleAssignment < MObject
    attr_accessible :m_person_id, :m_role_id

    belongs_to :m_role, :class_name => 'Fastui::MRole'
    belongs_to :m_person, :class_name => 'Fastui::MPerson'

  end
end
