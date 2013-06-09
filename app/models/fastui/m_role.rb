module Fastui
  class MRole < MObject

    attr_accessible :m_person_ids,  :access_level, :m_menu_id
    belongs_to :m_menu, :class_name => 'Fastui::MMenu'
    has_many :m_person_roles, :foreign_key => 'm_role_id', :class_name => 'Fastui::MPersonRole'
    has_many :m_people, :through => :m_person_roles, :source => :m_person



  end
end
