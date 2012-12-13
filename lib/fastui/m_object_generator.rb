module Fastui
  class MObjectGenerator
    def initialize
      @mo = {}
    end

    def make(type, attrs)
      attrs = attrs.to_a
      attrs.each do |attr|
        @mo[attr.name.to_s] = type.create(attr)
      end
    end

    def get(key)
      @mo[key.to_s]
    end

    def make_entity(entity_attr, property_attrs)
      make(Fastui::MEntity, entity_attr)
      self.get(entity_attr.name).m_properties.create(property_attrs)
    end

    def make_window(window_attr,tab_attrs)
      make(Fastui::MWindow, window_attr)
      self.get(window_attr.name).m_tabs.create(tab_attrs)
    end

    def win(win_attr, &block)
      w = Fastui::MWindow.create(win_attr)
      block.call(w) if block_given?
    end

    def tab(tab_attr, &block)

    end


  end
end
