module Fastui
  class MRelationship < ActiveRecord::Base

    belongs_to :m_person, :class_name => 'Fastui::MPerson'
    belongs_to :m_org, :class_name => 'Fastui::MOrg'
    belongs_to :m_role, :class_name => 'Fastui::MRole'
  end
end
