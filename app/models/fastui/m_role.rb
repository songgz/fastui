module Fastui
  class MRole < MObject
    # attr_accessible :title, :body
    attr_accessible :m_person_ids
    has_many :m_role_assignments, :foreign_key => 'm_role_id', :class_name => 'Fastui::MRoleAssignment'
    has_many :m_people, :through => :m_role_assignments, :source => :m_person



  end
end
