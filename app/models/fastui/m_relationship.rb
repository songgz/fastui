module Fastui
  class MRelationship < MObject
    attr_accessible :m_person_id,:m_org_id,:m_role_id

    belongs_to :m_person, :class_name => 'Fastui::MPerson'
    belongs_to :m_org, :class_name => 'Fastui::MOrg'
    belongs_to :m_role, :class_name => 'Fastui::MRole'
  end
end
