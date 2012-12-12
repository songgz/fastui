module Fastui
  class MDatatype < ActiveRecord::Base
    attr_accessible :id, :title, :print_text, :note, :name
    attr_accessible  :entity_class,:access_level,:entity_kind,:seq, :actived, :org_id,:org, :createdby, :createdby_id, :updatedby, :updatedby_id, :help

    belongs_to :org, :class_name => 'Fastui::MOrg'
    belongs_to :createdby, :class_name => 'Fastui::MPerson'
    belongs_to :updatedby, :class_name => 'Fastui::MPerson'
  end

  class MText < MDatatype
  end

  class MDate < MDatatype
  end

  class MHtmlEditor < MDatatype
  end

  class MComboBox < MDatatype
  end

  class MLongComboBox < MDatatype
  end

  class MTextArea < MDatatype
  end

  class MNumber < MDatatype
  end

  class MCheckBox < MDatatype
  end

  class MCheckboxGroup < MDatatype
  end

  class MSexSelect < MDatatype
  end

  class MFile < MDatatype
  end

  class MYesOrNo < MDatatype
  end

end
