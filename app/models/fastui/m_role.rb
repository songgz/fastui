module Fastui
  class MRole < MObject
    # attr_accessible :title, :body
    attr_accessible :person_ids
    has_many :m_relationships, :foreign_key => 'm_role_id', :class_name => 'Fastui::MRelationship'
    has_many :people, :through => :m_relationships, :source => :m_person



  end
end
