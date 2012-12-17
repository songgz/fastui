module Fastui
  class Acl
    include Singleton

    def initialize
      @entries = MAclEntry.all
    end

    def allow(aros = "*", acos = "*", permit = "*")
      aros = [aros] unless aros.is_a?(Array)
      acos = [acos] unless acos.is_a?(Array)
      aros.each do |aro|
        acos.each do |aco|
          entry = MAclEntry.first_or_initialize(:aro_type =>aro.class.to_s, :aro_id => aro.id, :aco_type =>aco.class.to_s, :aco_id => aco.id)
          entry.permit = permit
          entry.save
        end
      end
    end
  end
end
