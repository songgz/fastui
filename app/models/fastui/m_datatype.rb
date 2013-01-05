module Fastui
  class MDatatype < MObject
    attr_accessible  :m_entity,:m_entity_id,:access_level,:filter

    belongs_to :m_entity,:class_name => 'Fastui::MEntity'

    def class_name
      self.class.to_s
    end

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
