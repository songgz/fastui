# encoding: utf-8
#desc "Explaining what the task does"
namespace :fastui do
  desc "init fastui system data"
  task :system_data => :environment do

    org_system = Fastui::MOrg.create({:name => 'system', :title => '系统组织'})
    person1 = Fastui::MPerson.create({:name => 'Administrator', :title => '系统管理员'})

    v_number = Fastui::MDataType.create({:name => 'VNumber', :title => '整型'})
    v_date = Fastui::MDataType.create({:name => 'VDate', :title => '日期'})
    v_text = Fastui::MDataType.create({:name => 'VText', :title => '字符串'})
    v_htmleditor = Fastui::MDataType.create({:name => 'VHtmlEditor', :title => '文本编辑器'})
    v_textarea = Fastui::MDataType.create({:name => 'VTextArea', :title => '文本'})
    v_checkbox = Fastui::MDataType.create({:name => 'VCheckBox', :title => '选择框'})
    v_combobox = Fastui::MDataType.create({:name => 'VComboBox', :title => '下拉框'})
    v_defaultColumn = Fastui::MDataType.create({:name => 'VDefaultColumn', :title => 'grid默认列'})

    state = Fastui::MGlossary.create({:name => 'state', :title => '状态'})
    state_true = state.m_glossary_items.create({:name => 'true', :title => '是'})
    state_false = state.m_glossary_items.create({:name => 'false', :title => '否'})

    access_level = Fastui::MGlossary.create({:name => 'access_level', :title => '访问级别'})
    access_level_system = access_level.m_glossary_items.create({:name => 'system', :title => '系统级别'})
    access_level_org = access_level.m_glossary_items.create({:name => 'org', :title => '组织级别'})
    access_level_dept = access_level.m_glossary_items.create({:name => 'dept', :title => '部门级别'})

    entity_kind = Fastui::MGlossary.create({:name => 'entity_kind', :title => '实体种类'})
    entity_kind_sys = entity_kind.m_glossary_items.create({:name => 'sys', :title => '系统实体'})
    entity_kind_app = entity_kind.m_glossary_items.create({:name => 'app', :title => '应用实体'})

    window_kind = Fastui::MGlossary.create({:name => 'window_kind', :title => '窗体种类'})
    window_kind_maintain = window_kind.m_glossary_items.create({:name => 'maintain', :title => '维护'})
    window_kind_transaction = window_kind.m_glossary_items.create({:name => 'transaction', :title => '事务'})
    window_kind_query = window_kind.m_glossary_items.create({:name => 'query', :title => '查询'})

    refable_type = Fastui::MGlossary.create({:name => 'refable_type',:title => '引用类型'})
    ref_data_type = refable_type.m_glossary_items.create({:name => 'data_type',:title => 'data_type'})
    ref_glossary = refable_type.m_glossary_items.create({:name => 'glossary',:title => 'glossary'})
    ref_entity = refable_type.m_glossary_items.create({:name => 'entity',:title => 'entity'})


    #person1 = Fastui::MPerson.create({:name => 'Mr Li',:title => '李老师'})
    m_person = Fastui::MEntity.create({:name => 'Fastui::MPerson', :title => '人员', :access_level => access_level_system, :entity_kind => entity_kind_sys,
                                       :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity = Fastui::MEntity.create({:name => 'Fastui::MEntity', :title => '实体', :access_level => access_level_system, :entity_kind => entity_kind_sys,
                                       :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property = Fastui::MEntity.create({:name => 'Fastui::MProperty', :title => '属性', :access_level => access_level_system, :entity_kind => entity_kind_sys,
                                       :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_org = Fastui::MEntity.create({:name => 'Fastui::MOrg', :title => '组织', :access_level => access_level_system, :entity_kind => entity_kind_sys,
                                    :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})

    m_window = Fastui::MEntity.create({:name => 'Fastui::MWindow', :title => '窗口', :access_level => access_level_system,
                                       :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})

    #[{name: 'id',title: 'ID',refable: v_number,entity_kind: entity_kind_sys,seq:1,actived:state_true,org:org_system,createdby:person1,updatedby:person1},
    #{name:'title',title: '标题',refable: v_text}].each_with_index do |pro,seq_i|
    #    pro[:refable] = pro[:refable] || v_text
    #  pro[:entity_kind] = pro[:entity_kind] || entity_kind_sys
    ##'m_window'+'_'+ pro[:name] = m_window.m_properties.create({:title => pro[:title]})
    #
    #end


    m_window_id = m_window.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number,
                                                :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_title = m_window.m_properties.create({:name => 'title', :title => '标题', :refable => v_text,
                                                   :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_print_text = m_window.m_properties.create({:name => 'print_text', :title => '打印文本', :refable => v_text,
                                                   :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_name = m_window.m_properties.create({:name => 'name', :title => '标识', :refable => v_text,
                                                  :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_note = m_window.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea,
                                                  :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_entity_kind_id = m_window.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind,
                                                            :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_kind_id = m_window.m_properties.create({:name => 'window_kind_id', :title => '窗体种类', :refable => window_kind,
                                                     :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_seq = m_window.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number,
                                                 :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_actived_id = m_window.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state,
                                                        :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_help = m_window.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea,
                                                  :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_org_id = m_window.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org,
                                                    :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_createdby_id = m_window.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person,
                                                          :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_window_updatedby_id = m_window.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person,
                                                          :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})


    m_tab = Fastui::MEntity.create({:name => 'Fastui::MTab', :title => '标签', :access_level => access_level_system, :entity_kind => entity_kind_sys,
                                    :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_id = m_tab.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number,
                                          :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_title = m_tab.m_properties.create({:name => 'title', :title => '标题', :refable => v_text,
                                             :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_print_text = m_tab.m_properties.create({:name => 'print_text', :title => '打印文本', :refable => v_text,
                                             :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_name = m_tab.m_properties.create({:name => 'name', :title => '标识', :refable => v_text,
                                            :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_note = m_tab.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea,
                                            :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_read_id = m_tab.m_properties.create({:name => 'read_id', :title => '只读', :refable => state,
                                               :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_entity_kind_id = m_tab.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind})
    m_tab_seq = m_tab.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number,
                                           :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_actived_id = m_tab.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state,
                                                  :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_help = m_tab.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea,
                                            :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_window_id = m_tab.m_properties.create({:name => 'm_window_id', :title => '所属窗口', :refable => m_window,
                                                 :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_included_tab_id = m_tab.m_properties.create({:name => 'included_tab_id', :title => '依赖标签', :refable => m_tab,
                                                       :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_entity_id = m_tab.m_properties.create({:name => 'm_entity_id', :title => 'Model', :refable => m_entity,
                                                 :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_org_id = m_tab.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org,
                                              :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_createdby_id = m_tab.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person,
                                                    :entity_kind => entity_kind_sys, :seq => 12, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_tab_updatedby_id = m_tab.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person,
                                                    :entity_kind => entity_kind_sys, :seq => 13, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})


    m_field = Fastui::MEntity.create({:name => 'Fastui::MField', :title => '字段', :access_level => access_level_system, :entity_kind => entity_kind_sys,
                                      :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_id = m_field.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number,
                                              :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_title = m_field.m_properties.create({:name => 'title', :title => '标题', :refable => v_text,
                                                 :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_print_text = m_field.m_properties.create({:name => 'print_text', :title => '打印文本', :refable => v_text,
                                                 :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_name = m_field.m_properties.create({:name => 'name', :title => '标识', :refable => v_text,
                                                :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_note = m_field.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea,
                                                :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_property_id = m_field.m_properties.create({:name => 'm_property_id', :title => '所属属性', :refable => m_property,
                                                     :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_displayed = m_field.m_properties.create({:name => 'displayed_id', :title => '是否显示', :refable => state,
                                                     :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_read = m_field.m_properties.create({:name => 'read_id', :title => '是否只读', :refable => state,
                                                :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_entity_kind_id = m_field.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind,
                                                          :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_seq = m_field.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number,
                                               :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_actived_id = m_field.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state,
                                                      :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_org_id = m_field.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org,
                                                  :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_tab_id = m_field.m_properties.create({:name => 'm_tab_id', :title => '依赖标签', :refable => m_tab,
                                                  :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_createdby_id = m_field.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person,
                                                        :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_updatedby_id = m_field.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person,
                                                        :entity_kind => entity_kind_sys, :seq => 12, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_field_help = m_field.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea,
                                                :entity_kind => entity_kind_sys, :seq => 13, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})

    m_column = Fastui::MEntity.create({:name => 'Fastui::MColumn', :title => '表列', :access_level => access_level_system, :entity_kind => entity_kind_sys,
                                       :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_id = m_column.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number,
                                                :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_title = m_column.m_properties.create({:name => 'title', :title => '标题', :refable => v_text,
                                                   :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_print_text = m_column.m_properties.create({:name => 'print_text', :title => '打印文本', :refable => v_text,
                                                   :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_name = m_column.m_properties.create({:name => 'name', :title => '标识', :refable => v_text,
                                                  :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_note = m_column.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea,
                                                  :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_property_id = m_column.m_properties.create({:name => 'm_property_id', :title => '所属属性', :refable => m_property,
                                                   :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_width = m_column.m_properties.create({:name => 'width', :title => '列宽度', :refable => v_number,
                                                   :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_entity_kind_id = m_column.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind,
                                                            :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_seq = m_column.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number,
                                                 :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_actived_id = m_column.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state,
                                                        :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_org_id = m_column.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org,
                                                    :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_tab_id = m_column.m_properties.create({:name => 'm_tab_id', :title => '依赖标签', :refable => m_tab,
                                                    :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_createdby_id = m_column.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person,
                                                          :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_updatedby_id = m_column.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person,
                                                          :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_column_help = m_column.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea,
                                                  :entity_kind => entity_kind_sys, :seq => 12, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})


    fastui = Fastui::MWindow.create(:title => 'FastUI', :window_kind => window_kind_maintain, :entity_kind => entity_kind_sys,
                                    :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)
    fastui_window = fastui.m_tabs.create(:title => '窗口', :m_entity => m_window, :read => state_true, :entity_kind => entity_kind_sys,
                                         :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)
    fastui_window.m_columns.create([
                                       {:title => 'ID', :m_property => m_window_id, :width => 35, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '标题', :m_property => m_window_title, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '打印文本', :m_property => m_window_print_text, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '标识', :m_property => m_window_name, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '备注', :m_property => m_window_note, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '窗体种类', :m_property => m_window_kind_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '实体种类', :m_property => m_window_entity_kind_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '排序', :m_property => m_window_seq, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '是否激活', :m_property => m_window_actived_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '所属组织', :m_property => m_window_org_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '创建人', :m_property => m_window_createdby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '更新人', :m_property => m_window_updatedby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '帮助', :m_property => m_window_help, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                   ])
    fastui_window.m_fields.create([
                                      {:title => 'ID', :m_property => m_window_id, :displayed => state_true, :read => state_true,
                                       :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '标题', :m_property => m_window_title, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '打印文本', :m_property => m_window_print_text, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '标识', :m_property => m_window_name, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '备注', :m_property => m_window_note, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '窗体种类', :m_property => m_window_kind_id, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '实体种类', :m_property => m_window_entity_kind_id, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '排序', :m_property => m_window_seq, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '是否激活', :m_property => m_window_actived_id, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '所属组织', :m_property => m_window_org_id, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '创建人', :m_property => m_window_createdby_id, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '更新人', :m_property => m_window_updatedby_id, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '帮助', :m_property => m_window_help, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                  ])


    fastui_tab = fastui.m_tabs.create(:title => '标签', :m_entity => m_tab, :read => state_true, :entity_kind => entity_kind_sys, :included_tab => fastui_window,
                                      :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)
    fastui_tab.m_columns.create([{:title => 'ID', :m_property => m_tab_id, :width => 35, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '标题', :m_property => m_tab_title, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '打印文本', :m_property => m_tab_print_text, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '标识', :m_property => m_tab_name, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '备注', :m_property => m_tab_note, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '只读', :m_property => m_tab_read_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '实体种类', :m_property => m_tab_entity_kind_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '排序', :m_property => m_tab_seq, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '是否激活', :m_property => m_tab_actived_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '所属窗口', :m_property => m_tab_window_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '依赖标签', :m_property => m_tab_included_tab_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '所属实体', :m_property => m_tab_entity_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '所属组织', :m_property => m_tab_org_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '创建人', :m_property => m_tab_createdby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '更新人', :m_property => m_tab_updatedby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '帮助', :m_property => m_tab_help, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                ])
    fastui_tab.m_fields.create([{:title => 'ID', :m_property => m_tab_id, :displayed => state_true, :read => state_true,
                                 :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '标题', :m_property => m_tab_title, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '打印文本', :m_property => m_tab_print_text, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '标识', :m_property => m_tab_name, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '备注', :m_property => m_tab_note, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '只读', :m_property => m_tab_read_id, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '实体种类', :m_property => m_tab_entity_kind_id, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '排序', :m_property => m_tab_seq, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '是否激活', :m_property => m_tab_actived_id, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '所属窗口', :m_property => m_tab_window_id, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '依赖标签', :m_property => m_tab_included_tab_id, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '所属实体', :m_property => m_tab_entity_id, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '所属组织', :m_property => m_tab_org_id, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '创建人', :m_property => m_tab_createdby_id, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '更新人', :m_property => m_tab_updatedby_id, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 12, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                {:title => '帮助', :m_property => m_tab_help, :displayed => state_true, :read => state_false,
                                 :entity_kind => entity_kind_sys, :seq => 13, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                               ])
    fastui_field = fastui.m_tabs.create(:title => '字段', :m_entity => m_field, :read => state_true, :entity_kind => entity_kind_sys, :included_tab => fastui_tab,
                                        :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)
    fastui_field.m_columns.create([{:title => 'ID', :m_property => m_field_id, :width => 35, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '标题', :m_property => m_field_title, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '打印文本', :m_property => m_field_print_text, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '标识', :m_property => m_field_name, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '备注', :m_property => m_field_note, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '所属属性', :m_property => m_field_property_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '显示', :m_property => m_field_displayed, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '只读', :m_property => m_field_read, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '实体种类', :m_property => m_field_entity_kind_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '排序', :m_property => m_field_seq, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '是否激活', :m_property => m_field_actived_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '所属组织', :m_property => m_field_org_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '依赖标签', :m_property => m_field_tab_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '创建人', :m_property => m_field_createdby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '更新人', :m_property => m_field_updatedby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '帮助', :m_property => m_field_help, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                  ])

    fastui_field.m_fields.create([{:title => 'ID', :m_property => m_field_id, :displayed => state_true,
                                   :read => state_true, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '标题', :m_property => m_field_title, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '打印文本', :m_property => m_field_print_text, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '标识', :m_property => m_field_name, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '备注', :m_property => m_field_note, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '所属属性', :m_property => m_field_property_id, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '显示', :m_property => m_field_displayed, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '只读', :m_property => m_field_read, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '实体种类', :m_property => m_field_entity_kind_id, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '排序', :m_property => m_field_seq, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '是否激活', :m_property => m_field_actived_id, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '所属组织', :m_property => m_field_org_id, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '依赖标签', :m_property => m_field_tab_id, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '创建人', :m_property => m_field_createdby_id, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '更新人', :m_property => m_field_updatedby_id, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '帮助', :m_property => m_field_help, :displayed => state_true, :read => state_false,
                                   :entity_kind => entity_kind_sys, :seq => 12, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                 ])


    fastui_column = fastui.m_tabs.create(:title => '表列', :m_entity => m_column, :read => state_true, :entity_kind => entity_kind_sys, :included_tab => fastui_tab,
                                         :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)
    fastui_column.m_columns.create([{:title => 'ID', :m_property => m_column_id, :width => 35, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '标题', :m_property => m_column_title, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '打印文本', :m_property => m_column_print_text, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '标识', :m_property => m_column_name, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '备注', :m_property => m_column_note, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '所属属性', :m_property => m_column_property_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '列宽度', :m_property => m_column_width, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '实体种类', :m_property => m_column_entity_kind_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '排序', :m_property => m_column_seq, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '是否激活', :m_property => m_column_actived_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '所属组织', :m_property => m_column_org_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '依赖标签', :m_property => m_column_tab_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '创建人', :m_property => m_column_createdby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '更新人', :m_property => m_column_updatedby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '帮助', :m_property => m_column_help, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                   ])

    fastui_column.m_fields.create([{:title => 'ID', :m_property => m_column_id, :displayed => state_true, :read => state_true,
                                    :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '标题', :m_property => m_column_title, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '打印文本', :m_property => m_column_print_text, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '标识', :m_property => m_column_name, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '备注', :m_property => m_column_note, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '所属属性', :m_property => m_column_property_id, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '列宽度', :m_property => m_column_width, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '实体种类', :m_property => m_column_entity_kind_id, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '排序', :m_property => m_column_seq, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '是否激活', :m_property => m_column_actived_id, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '所属组织', :m_property => m_column_org_id, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '依赖标签', :m_property => m_column_tab_id, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '创建人', :m_property => m_column_createdby_id, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '更新人', :m_property => m_column_updatedby_id, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '帮助', :m_property => m_column_help, :displayed => state_true, :read => state_false,
                                    :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                  ])


    # 导航树 初始化数据

    menu_sys = Fastui::MMenu.create({:name => 'menu_sys', :title => '系统菜单',
                                     :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})


    # 实体
    #m_entity = Fastui::MEntity.create({:name => 'm_entity', :title => 'm_entity', :access_level => access_level_system, :entity_kind => entity_kind_sys,
    #                                   :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_id = m_entity.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number,
                                                :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_title = m_entity.m_properties.create({:name => 'title', :title => '标题', :refable => v_text,
                                                   :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_print_text = m_entity.m_properties.create({:name => 'print_text', :title => '打印文本', :refable => v_text,
                                                   :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_name = m_entity.m_properties.create({:name => 'name', :title => '标识', :refable => v_text,
                                                  :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_note = m_entity.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea,
                                                  :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_access_level_id = m_entity.m_properties.create({:name => 'access_level_id', :title => '访问级别', :refable => access_level_system,
                                                             :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_entity_kind_id = m_entity.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind,
                                                            :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_seq = m_entity.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number,
                                                 :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_actived_id = m_entity.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state,
                                                        :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_help = m_entity.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea,
                                                  :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_org_id = m_entity.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org,
                                                    :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_createdby_id = m_entity.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person,
                                                          :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_updatedby_id = m_entity.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person,
                                                          :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})

    # 属性
    #m_property = Fastui::MEntity.create({:name => 'm_property', :title => 'm_property', :access_level => access_level_system, :entity_kind => entity_kind_sys,
    #                                     :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_id = m_property.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number,
                                                    :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_title = m_property.m_properties.create({:name => 'title', :title => '标题', :refable => v_text,
                                                       :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_print_text = m_property.m_properties.create({:name => 'print_text', :title => '打印文本', :refable => v_text,
                                                       :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_name = m_property.m_properties.create({:name => 'name', :title => '标识', :refable => v_text,
                                                      :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_note = m_property.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea,
                                                      :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_external_key = m_property.m_properties.create({:name => 'external_key', :title => '外键', :refable => v_text,
                                                      :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_refable = m_property.m_properties.create({:name => 'refable', :title => '引用类型', :refable => refable_type,
                                                      :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_entity_kind_id = m_property.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind,
                                                                :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_entity_id = m_property.m_properties.create({:name => 'm_entity_id', :title => '所属实体', :refable => m_entity,
                                                           :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_seq = m_property.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number,
                                                     :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_actived_id = m_property.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state,
                                                            :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_help = m_property.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea,
                                                      :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_org_id = m_property.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org,
                                                        :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_createdby_id = m_property.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person,
                                                              :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_updatedby_id = m_property.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person,
                                                              :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})

    # 菜单
    m_menu = Fastui::MEntity.create({:name => 'Fastui::MMenu', :title => '菜单', :access_level => access_level_system, :entity_kind => entity_kind_sys,
                                     :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_id = m_menu.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number,
                                            :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_title = m_menu.m_properties.create({:name => 'title', :title => '标题', :refable => v_text,
                                               :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_print_text = m_menu.m_properties.create({:name => 'print_text', :title => '打印文本', :refable => v_text,
                                               :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_name = m_menu.m_properties.create({:name => 'name', :title => '标识', :refable => v_text,
                                              :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_entity_kind_id = m_menu.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind,
                                                        :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_seq = m_menu.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number,
                                             :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_actived_id = m_menu.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state,
                                                    :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_help = m_menu.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea,
                                              :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_org_id = m_menu.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org,
                                                :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_createdby_id = m_menu.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person,
                                                      :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_updatedby_id = m_menu.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person,
                                                      :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})

    # 菜单项
    m_menu_item = Fastui::MEntity.create({:name => 'Fastui::MMenuItem', :title => '菜单项', :access_level => access_level_system, :entity_kind => entity_kind_sys,
                                          :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_id = m_menu_item.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number,
                                                      :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_title = m_menu_item.m_properties.create({:name => 'title', :title => '标题', :refable => v_text,
                                                         :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_print_text = m_menu_item.m_properties.create({:name => 'print_text', :title => '打印文本', :refable => v_text,
                                                         :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_name = m_menu_item.m_properties.create({:name => 'name', :title => '标识', :refable => v_text,
                                                        :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_entity_kind_id = m_menu_item.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind,
                                                                  :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_m_menu = m_menu_item.m_properties.create({:name => 'm_menu_id', :title => '对应菜单', :refable => m_menu,
                                                          :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_m_window = m_menu_item.m_properties.create({:name => 'm_window_id', :title => '对应窗口', :refable => m_window,
                                                            :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_seq = m_menu_item.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number,
                                                       :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_actived_id = m_menu_item.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state,
                                                              :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_help = m_menu_item.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea,
                                                        :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_org_id = m_menu_item.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org,
                                                          :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_createdby_id = m_menu_item.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person,
                                                                :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_updatedby_id = m_menu_item.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person,
                                                                :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})

    # 词汇
    m_glossary = Fastui::MEntity.create({:name => 'Fastui::MGlossary', :title => '词汇', :access_level => access_level_system, :entity_kind => entity_kind_sys,
                                         :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_id = m_glossary.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number,
                                                    :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_title = m_glossary.m_properties.create({:name => 'title', :title => '标题', :refable => v_text,
                                                       :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_print_text = m_glossary.m_properties.create({:name => 'print_text', :title => '打印文本', :refable => v_text,
                                                       :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_note = m_glossary.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea,
                                                      :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_name = m_glossary.m_properties.create({:name => 'name', :title => '标识', :refable => v_text,
                                                      :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_entity_kind_id = m_glossary.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind,
                                                                :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_seq = m_glossary.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number,
                                                     :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_actived_id = m_glossary.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state,
                                                            :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_help = m_glossary.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea,
                                                      :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_org_id = m_glossary.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org,
                                                        :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_createdby_id = m_glossary.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person,
                                                              :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_updatedby_id = m_glossary.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person,
                                                              :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})

    # 词汇项
    m_glossary_item = Fastui::MEntity.create({:name => 'Fastui::MGlossaryItem', :title => '词汇项', :access_level => access_level_system, :entity_kind => entity_kind_sys,
                                              :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_id = m_glossary_item.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number,
                                                              :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_title = m_glossary_item.m_properties.create({:name => 'title', :title => '标题', :refable => v_text,
                                                                 :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_print_text = m_glossary_item.m_properties.create({:name => 'print_text', :title => '打印文本', :refable => v_text,
                                                                 :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_note = m_glossary_item.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea,
                                                                :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_name = m_glossary_item.m_properties.create({:name => 'name', :title => '标识', :refable => v_text,
                                                                :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_entity_kind_id = m_glossary_item.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind,
                                                                          :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_seq = m_glossary_item.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number,
                                                               :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_actived_id = m_glossary_item.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state,
                                                                      :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_help = m_glossary_item.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea,
                                                                :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_org_id = m_glossary_item.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org,
                                                                  :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_createdby_id = m_glossary_item.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person,
                                                                        :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_glossary_item_updatedby_id = m_glossary_item.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person,
                                                                        :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})


    win_glossary = Fastui::MWindow.create(:title => '词汇', :window_kind => window_kind_maintain, :entity_kind => entity_kind_sys,
                                          :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)
    win_glossary_g = win_glossary.m_tabs.create(:title => '词汇', :m_entity => m_glossary, :read => state_true, :entity_kind => entity_kind_sys,
                                                :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)

    win_glossary_g.m_columns.create([
                                        {:title => 'ID', :m_property => m_glossary_id, :width => 35, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '标题', :m_property => m_glossary_title, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '打印文本', :m_property => m_glossary_print_text, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '标识', :m_property => m_glossary_name, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '备注', :m_property => m_glossary_note, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '实体种类', :m_property => m_glossary_entity_kind_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '排序', :m_property => m_glossary_seq, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '是否激活', :m_property => m_glossary_actived_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '所属组织', :m_property => m_glossary_org_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '创建人', :m_property => m_glossary_createdby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '更新人', :m_property => m_glossary_updatedby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '帮助', :m_property => m_glossary_help, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                    ])
    win_glossary_g.m_fields.create([
                                       {:title => 'ID', :m_property => m_glossary_id, :displayed => state_true, :read => state_true,
                                        :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '标题', :m_property => m_glossary_title, :displayed => state_true, :read => state_false,
                                        :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '打印文本', :m_property => m_glossary_print_text, :displayed => state_true, :read => state_false,
                                        :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '标识', :m_property => m_glossary_name, :displayed => state_true, :read => state_false,
                                        :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '备注', :m_property => m_glossary_note, :displayed => state_true, :read => state_false,
                                        :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '实体种类', :m_property => m_glossary_entity_kind_id, :displayed => state_true, :read => state_false,
                                        :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '排序', :m_property => m_glossary_seq, :displayed => state_true, :read => state_false,
                                        :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '是否激活', :m_property => m_glossary_actived_id, :displayed => state_true, :read => state_false,
                                        :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '所属组织', :m_property => m_glossary_org_id, :displayed => state_true, :read => state_false,
                                        :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '创建人', :m_property => m_glossary_createdby_id, :displayed => state_true, :read => state_false,
                                        :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '更新人', :m_property => m_glossary_updatedby_id, :displayed => state_true, :read => state_false,
                                        :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '帮助', :m_property => m_glossary_help, :displayed => state_true, :read => state_false,
                                        :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                   ])


    win_glossary_item = win_glossary.m_tabs.create(:title => '词汇项', :m_entity => m_glossary_item, :read => state_true, :entity_kind => entity_kind_sys,:included_tab => win_glossary_g,
                                                   :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)

    win_glossary_item.m_columns.create([
                                           {:title => 'ID', :m_property => m_glossary_item_id, :width => 35, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                           {:title => '标题', :m_property => m_glossary_item_title, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                           {:title => '打印文本', :m_property => m_glossary_item_print_text, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                           {:title => '标识', :m_property => m_glossary_item_name, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                           {:title => '备注', :m_property => m_glossary_item_note, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                           {:title => '实体种类', :m_property => m_glossary_item_entity_kind_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                           {:title => '排序', :m_property => m_glossary_item_seq, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                           {:title => '是否激活', :m_property => m_glossary_item_actived_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                           {:title => '所属组织', :m_property => m_glossary_item_org_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                           {:title => '创建人', :m_property => m_glossary_item_createdby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                           {:title => '更新人', :m_property => m_glossary_item_updatedby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                           {:title => '帮助', :m_property => m_glossary_item_help, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                       ])
    win_glossary_item.m_fields.create([
                                          {:title => 'ID', :m_property => m_glossary_item_id, :displayed => state_true, :read => state_true,
                                           :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '标题', :m_property => m_glossary_item_title, :displayed => state_true, :read => state_false,
                                           :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '打印文本', :m_property => m_glossary_item_print_text, :displayed => state_true, :read => state_false,
                                           :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '标识', :m_property => m_glossary_item_name, :displayed => state_true, :read => state_false,
                                           :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '备注', :m_property => m_glossary_item_note, :displayed => state_true, :read => state_false,
                                           :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '实体种类', :m_property => m_glossary_item_entity_kind_id, :displayed => state_true, :read => state_false,
                                           :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '排序', :m_property => m_glossary_item_seq, :displayed => state_true, :read => state_false,
                                           :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '是否激活', :m_property => m_glossary_item_actived_id, :displayed => state_true, :read => state_false,
                                           :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '所属组织', :m_property => m_glossary_item_org_id, :displayed => state_true, :read => state_false,
                                           :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '创建人', :m_property => m_glossary_item_createdby_id, :displayed => state_true, :read => state_false,
                                           :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '更新人', :m_property => m_glossary_item_updatedby_id, :displayed => state_true, :read => state_false,
                                           :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '帮助', :m_property => m_glossary_item_help, :displayed => state_true, :read => state_false,
                                           :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                      ])


    win_entity = Fastui::MWindow.create(:title => '实体', :window_kind => window_kind_maintain, :entity_kind => entity_kind_sys,
                                        :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)
    win_entity_model = win_entity.m_tabs.create(:title => '实体', :m_entity => m_entity, :read => state_true, :entity_kind => entity_kind_sys,
                                                :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)
    win_entity_model.m_columns.create([
                                          {:title => 'ID', :m_property => m_entity_id, :width => 35, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '标题', :m_property => m_entity_title, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '打印文本', :m_property => m_entity_print_text, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '标识', :m_property => m_entity_name, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '备注', :m_property => m_entity_note, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '访问级别', :m_property => m_entity_access_level_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '实体种类', :m_property => m_entity_entity_kind_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '排序', :m_property => m_entity_seq, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '是否激活', :m_property => m_entity_actived_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '所属组织', :m_property => m_entity_org_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '创建人', :m_property => m_entity_createdby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '更新人', :m_property => m_entity_updatedby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '帮助', :m_property => m_entity_help, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                      ])
    win_entity_model.m_fields.create([
                                         {:title => 'ID', :m_property => m_entity_id, :displayed => state_true, :read => state_true,
                                          :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '标题', :m_property => m_entity_title, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '打印文本', :m_property => m_entity_print_text, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '标识', :m_property => m_entity_name, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '备注', :m_property => m_entity_note, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '访问级别', :m_property => m_entity_access_level_id, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '实体种类', :m_property => m_entity_entity_kind_id, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '排序', :m_property => m_entity_seq, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '是否激活', :m_property => m_entity_actived_id, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '所属组织', :m_property => m_entity_org_id, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '创建人', :m_property => m_entity_createdby_id, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '更新人', :m_property => m_entity_updatedby_id, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '帮助', :m_property => m_entity_help, :displayed => state_true, :read => state_false,
                                          :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                     ])


    win_entity_property = win_entity.m_tabs.create(:title => '属性', :m_entity => m_property, :read => state_true, :entity_kind => entity_kind_sys,:included_tab => win_entity_model,
                                                   :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)
    win_entity_property.m_columns.create([
                                             {:title => 'ID', :m_property => m_property_id, :width => 35, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '标题', :m_property => m_property_title, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '打印文本', :m_property => m_property_print_text, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '标识', :m_property => m_property_name, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '外键', :m_property => m_property_external_key, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '备注', :m_property => m_property_note, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '引用类型', :m_property => m_property_refable, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '实体种类', :m_property => m_property_entity_kind_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '所属实体', :m_property => m_property_entity_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '排序', :m_property => m_property_seq, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '是否激活', :m_property => m_property_actived_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '所属组织', :m_property => m_property_org_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '创建人', :m_property => m_property_createdby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '更新人', :m_property => m_property_updatedby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '帮助', :m_property => m_property_help, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                         ])
    win_entity_property.m_fields.create([
                                            {:title => 'ID', :m_property => m_property_id, :displayed => state_true, :read => state_true,
                                             :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '标题', :m_property => m_property_title, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '打印文本', :m_property => m_property_print_text, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '标识', :m_property => m_property_name, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '外键', :m_property => m_property_external_key, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '备注', :m_property => m_property_note, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '引用类型', :m_property => m_property_refable, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '实体种类', :m_property => m_property_entity_kind_id, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '所属实体', :m_property => m_property_entity_id, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '排序', :m_property => m_property_seq, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '是否激活', :m_property => m_property_actived_id, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '所属组织', :m_property => m_property_org_id, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '创建人', :m_property => m_property_createdby_id, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '更新人', :m_property => m_property_updatedby_id, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '帮助', :m_property => m_property_help, :displayed => state_true, :read => state_false,
                                             :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                        ])


    sys_win_menu = Fastui::MWindow.create(:title => '菜单', :window_kind => window_kind_maintain, :entity_kind => entity_kind_sys,
                                          :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)

    sys_menu = sys_win_menu.m_tabs.create(:title => '菜单', :m_entity => m_menu, :read => state_true, :entity_kind => entity_kind_sys,
                                          :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)
    sys_menu.m_columns.create([
                                  {:title => 'ID', :m_property => m_menu_id, :width => 35, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '标题', :m_property => m_menu_title, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '打印文本', :m_property => m_menu_print_text, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '标识', :m_property => m_menu_name, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '实体种类', :m_property => m_menu_entity_kind_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '排序', :m_property => m_menu_seq, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '是否激活', :m_property => m_menu_actived_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '所属组织', :m_property => m_menu_org_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '创建人', :m_property => m_menu_createdby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '更新人', :m_property => m_menu_updatedby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '帮助', :m_property => m_menu_help, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                              ])
    sys_menu.m_fields.create([
                                 {:title => 'ID', :m_property => m_menu_id, :displayed => state_true, :read => state_true,
                                  :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '标题', :m_property => m_menu_title, :displayed => state_true, :read => state_false,
                                  :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '打印文本', :m_property => m_menu_print_text, :displayed => state_true, :read => state_false,
                                  :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '标识', :m_property => m_menu_name, :displayed => state_true, :read => state_false,
                                  :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '实体种类', :m_property => m_menu_entity_kind_id, :displayed => state_true, :read => state_false,
                                  :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '排序', :m_property => m_menu_seq, :displayed => state_true, :read => state_false,
                                  :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '是否激活', :m_property => m_menu_actived_id, :displayed => state_true, :read => state_false,
                                  :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '所属组织', :m_property => m_menu_org_id, :displayed => state_true, :read => state_false,
                                  :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '创建人', :m_property => m_menu_createdby_id, :displayed => state_true, :read => state_false,
                                  :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '更新人', :m_property => m_menu_updatedby_id, :displayed => state_true, :read => state_false,
                                  :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '帮助', :m_property => m_menu_help, :displayed => state_true, :read => state_false,
                                  :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                             ])


    sys_menu_item = sys_win_menu.m_tabs.create(:title => '菜单项', :m_entity => m_menu_item, :read => state_true, :entity_kind => entity_kind_sys,:included_tab => sys_menu,
                                               :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1)

    sys_menu_item.m_columns.create([
                                       {:title => 'ID', :m_property => m_menu_item_id, :width => 35, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '标题', :m_property => m_menu_item_title, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '打印文本', :m_property => m_menu_item_print_text, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '标识', :m_property => m_menu_item_name, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '实体种类', :m_property => m_menu_item_entity_kind_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '对应菜单', :m_property => m_menu_item_m_menu, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '对应窗口', :m_property => m_menu_item_m_window, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '排序', :m_property => m_menu_item_seq, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '是否激活', :m_property => m_menu_item_actived_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '所属组织', :m_property => m_menu_item_org_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '创建人', :m_property => m_menu_item_createdby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '更新人', :m_property => m_menu_item_updatedby_id, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '帮助', :m_property => m_menu_item_help, :width => 75, :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                   ])
    sys_menu_item.m_fields.create([
                                      {:title => 'ID', :m_property => m_menu_item_id, :displayed => state_true, :read => state_true,
                                       :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '标题', :m_property => m_menu_item_title, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '打印文本', :m_property => m_menu_item_print_text, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '标识', :m_property => m_menu_item_name, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '实体种类', :m_property => m_menu_item_entity_kind_id, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '对应菜单', :m_property => m_menu_item_m_menu, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '对应窗口', :m_property => m_menu_item_m_window, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '排序', :m_property => m_menu_item_seq, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 6, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '是否激活', :m_property => m_menu_item_actived_id, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 7, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '所属组织', :m_property => m_menu_item_org_id, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 8, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '创建人', :m_property => m_menu_item_createdby_id, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 9, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '更新人', :m_property => m_menu_item_updatedby_id, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 10, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '帮助', :m_property => m_menu_item_help, :displayed => state_true, :read => state_false,
                                       :entity_kind => entity_kind_sys, :seq => 11, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1}
                                  ])


    menu_sys_settings = Fastui::MMenuItem.create({:name => 'sys_tools', :title => '系统设置', :m_menu_id => menu_sys.id, :m_window_id => 0,
                                                  :entity_kind => entity_kind_sys, :seq => 1, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    menu_sys_settings_win_entity = menu_sys_settings.children.create({:name => 'win_glossary', :title => '词汇', :m_window_id => win_glossary.id, :m_menu_id => menu_sys.id,
                                                                      :entity_kind => entity_kind_sys, :seq => 2, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    menu_sys_settings_win_entity = menu_sys_settings.children.create({:name => 'win_entity', :title => '实体', :m_window_id => win_entity.id, :m_menu_id => menu_sys.id,
                                                                      :entity_kind => entity_kind_sys, :seq => 3, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    menu_sys_settings_fastui = menu_sys_settings.children.create({:name => 'sys_fastui', :title => 'FastUI', :m_window_id => fastui.id, :m_menu_id => menu_sys.id,
                                                                  :entity_kind => entity_kind_sys, :seq => 4, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})
    menu_sys_settings_win_menu = menu_sys_settings.children.create({:name => 'win_menu', :title => '菜单', :m_window_id => sys_win_menu.id, :m_menu_id => menu_sys.id,
                                                                    :entity_kind => entity_kind_sys, :seq => 5, :actived => state_true, :org => org_system, :createdby => person1, :updatedby => person1})

  end
end
