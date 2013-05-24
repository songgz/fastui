# encoding: utf-8
require 'bcrypt'
module Fastui
  class MPerson < MObject
    attr_accessible :username, :password, :access_level
    has_many :m_role_assignments, :foreign_key => 'm_person_id', :class_name => 'Fastui::MRoleAssignment'
    has_many :m_roles, :through => :m_role_assignments, :source => :m_role

    # users.password_digest in the database is a :string
    include BCrypt
    def password
      @password ||= Password.new(self.password_digest)
    end

    def password=(new_password)
      self.password_digest = Password.create(new_password)
    end
  end
end
