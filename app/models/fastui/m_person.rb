# encoding: utf-8
require 'bcrypt'
module Fastui
  class MPerson < MObject
    attr_accessible :username,:password
    has_many :m_relationships, :foreign_key => 'm_person_id', :class_name => 'Fastui::MRelationship'
    has_many :act_roles, :through => :m_relationships, :source => :m_role
    has_many :join_orgs, :through => :m_relationships, :source => :m_org

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
