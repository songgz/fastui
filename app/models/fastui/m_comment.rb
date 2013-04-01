module Fastui
  class MComment < ActiveRecord::Base
    attr_accessible :title, :note, :guide, :memo, :total
  end
end