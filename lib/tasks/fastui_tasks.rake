# encoding: utf-8
#desc "Explaining what the task does"
namespace :fastui do
  desc "init fastui system data"
  task :system_data => :environment do

    org_system = Fastui::MOrg.create({:name => 'system', :title => '系统组织'})

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
    access_level.m_glossary_items.create([
                                             {:name => 'system', :title => '系统级别'},
                                             {:name => 'org', :title => '组织级别'},
                                             {:name => 'dept', :title => '部门级别'}
                                         ])

    entity_kind = Fastui::MGlossary.create({:name => 'entity_kind', :title => '实体种类'})
    entity_kind_sys = entity_kind.m_glossary_items.create({:name => 'sys', :title => '系统实体'})
    entity_kind_app = entity_kind.m_glossary_items.create({:name => 'app', :title => '应用实体'})

    window_kind = Fastui::MGlossary.create({:name => 'window_kind', :title => '窗体种类'})
    window_kind_maintain = window_kind.m_glossary_items.create({:name => 'maintain', :title => '维护'})
    window_kind_transaction = window_kind.m_glossary_items.create({:name => 'transaction', :title => '事务'})
    window_kind_query = window_kind.m_glossary_items.create({:name => 'query', :title => '查询'})

    
    m_org = Fastui::MEntity.create({:name => 'm_org', :title => '组织', :entity_kind => entity_kind_sys})
    person1 = Fastui::MPerson.create({:name => 'Administrator',:title => '超级管理员'})
    #person1 = Fastui::MPerson.create({:name => 'Mr Li',:title => '李老师'})
    m_person = Fastui::MEntity.create({:name => 'm_person',:title => '人员',:entity_kind => entity_kind_app })


    m_window = Fastui::MEntity.create({:name => 'm_window', :title => '窗口', :entity_kind => entity_kind_sys})
    m_window_id = m_window.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number})
    m_window_title = m_window.m_properties.create({:name => 'title', :title => '标题', :refable => v_text})
    m_window_note = m_window.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea})
    m_window_entity_kind_id = m_window.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind})
    m_window_kind_id = m_window.m_properties.create({:name => 'window_kind_id', :title => '窗体种类', :refable => window_kind})
    m_window_seq = m_window.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number})
    m_window_actived_id = m_window.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state})
    m_window_help = m_window.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea})
    m_window_org_id = m_window.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org})
    m_window_createdby_id = m_window.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person})
    m_window_updatedby_id = m_window.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person})


    m_tab = Fastui::MEntity.create({:name => 'm_tab', :title => '标签', :entity_kind => entity_kind_sys})
    m_tab_id = m_tab.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number})
    m_tab_title = m_tab.m_properties.create({:name => 'title', :title => '标题', :refable => v_text})
    m_tab_note = m_tab.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea})
    m_tab_read_id = m_tab.m_properties.create({:name => 'read_id', :title => '只读', :refable => state})
    m_tab_entity_kind_id = m_tab.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind})
    m_tab_seq = m_tab.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number})
    m_tab_actived_id = m_tab.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state})
    m_tab_help = m_tab.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea})
    m_tab_window_id = m_tab.m_properties.create({:name => 'm_window_id', :title => '所属窗口', :refable => m_window})
    m_tab_entity_id = m_tab.m_properties.create({:name => 'm_entity_id', :title => '对应实体', :refable => m_tab})
    m_tab_org_id = m_tab.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org})
    m_tab_createdby_id = m_tab.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person})
    m_tab_updatedby_id = m_tab.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person})


    m_field = Fastui::MEntity.create({:name => 'm_field', :title => '字段', :entity_kind => entity_kind_sys})
    m_field_id = m_field.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number})
    m_field_title = m_field.m_properties.create({:name => 'title', :title => '标题', :refable => v_text})
    m_field_note = m_field.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea})
    m_field_displayed = m_field.m_properties.create({:name => 'displayed_id', :title => '是否显示', :refable => state})
    m_field_read = m_field.m_properties.create({:name => 'read_id', :title => '是否只读', :refable => state})
    m_field_entity_kind_id = m_field.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind})
    m_field_seq = m_field.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number})
    m_field_actived_id = m_field.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state})
    m_field_org_id = m_field.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org})
    m_field_createdby_id = m_field.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person})
    m_field_updatedby_id = m_field.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person})
    m_field_help = m_field.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea})

    m_column = Fastui::MEntity.create({:name => 'm_column', :title => '表列', :entity_kind => entity_kind_sys})
    m_column_id = m_column.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number})
    m_column_title = m_column.m_properties.create({:name => 'title', :title => '标题', :refable => v_text})
    m_column_note = m_column.m_properties.create({:name => 'note', :title => '备注', :refable => v_textarea})
    m_column_width = m_column.m_properties.create({:name => 'width', :title => '列宽度', :refable => v_number})
    m_column_entity_kind_id = m_column.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind})
    m_column_seq = m_column.m_properties.create({:name => 'seq', :title => '排序', :refable => v_number})
    m_column_actived_id = m_column.m_properties.create({:name => 'actived_id', :title => '是否激活', :refable => state})
    m_column_org_id = m_column.m_properties.create({:name => 'org_id', :title => '所属组织', :refable => m_org})
    m_column_createdby_id = m_column.m_properties.create({:name => 'createdby_id', :title => '创建人', :refable => m_person})
    m_column_updatedby_id = m_column.m_properties.create({:name => 'updatedby_id', :title => '更新人', :refable => m_person})
    m_column_help = m_column.m_properties.create({:name => 'help', :title => '帮助', :refable => v_textarea})


    fastui = Fastui::MWindow.create(:title => 'FastUI', :window_kind => window_kind_maintain, :entity_kind => entity_kind_sys,
                                    :seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1)
    fastui_window = fastui.m_tabs.create(:title => '窗口', :m_entity => m_window,:read => state_true,:entity_kind => entity_kind_sys,
                                         :seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1)
    fastui_window.m_columns.create([
                                       {:title => 'ID', :m_property => m_window_id, :width => 35,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                       {:title => '名称', :m_property => m_window_title, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                       {:title => '备注', :m_property => m_window_note, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                       {:title => '窗体种类', :m_property => m_window_kind_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                       {:title => '实体种类', :m_property => m_window_entity_kind_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                       {:title => '排序', :m_property => m_window_seq, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                       {:title => '是否激活', :m_property => m_window_actived_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                       {:title => '所属组织', :m_property => m_window_org_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                       {:title => '创建人', :m_property => m_window_createdby_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                       {:title => '更新人', :m_property => m_window_updatedby_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                       {:title => '帮助', :m_property => m_window_help, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 }
                                   ])
    fastui_window.m_fields.create([
                                      {:title => 'ID', :m_property => m_window_id,:displayed => state_true,:read =>state_true,
                                       :entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                      {:title => '名称', :m_property => m_window_title,:displayed => state_true,:read =>state_false,
                                       :entity_kind => entity_kind_sys,:seq => 2,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                      {:title => '备注', :m_property => m_window_note,:displayed => state_true,:read =>state_false,
                                       :entity_kind => entity_kind_sys,:seq => 3,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                      {:title => '窗体种类', :m_property => m_window_kind_id,:displayed => state_true,:read =>state_false,
                                       :entity_kind => entity_kind_sys,:seq => 4,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                      {:title => '实体种类', :m_property => m_window_entity_kind_id,:displayed => state_true,:read =>state_false,
                                       :entity_kind => entity_kind_sys,:seq => 5,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                      {:title => '排序', :m_property => m_window_seq,:displayed => state_true,:read =>state_false,
                                       :entity_kind => entity_kind_sys,:seq => 6,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                      {:title => '是否激活', :m_property => m_window_actived_id,:displayed => state_true,:read =>state_false,
                                       :entity_kind => entity_kind_sys,:seq => 7,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                      {:title => '所属组织', :m_property => m_window_org_id,:displayed => state_true,:read =>state_false,
                                       :entity_kind => entity_kind_sys,:seq => 8,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                      {:title => '创建人', :m_property => m_window_createdby_id,:displayed => state_true,:read =>state_false,
                                       :entity_kind => entity_kind_sys,:seq => 9,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                      {:title => '更新人', :m_property => m_window_updatedby_id,:displayed => state_true,:read =>state_false,
                                       :entity_kind => entity_kind_sys,:seq => 10,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                      {:title => '帮助', :m_property => m_window_help,:displayed => state_true,:read =>state_false,
                                       :entity_kind => entity_kind_sys,:seq => 11,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1}
                                  ])


    fastui_tab = fastui.m_tabs.create(:title => '标签', :m_entity => m_tab,:read => state_true,:entity_kind => entity_kind_sys,
                                      :seq => 2,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1)
    fastui_tab.m_columns.create([{:title => 'ID', :m_property => m_tab_id, :width => 35,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                 {:title => '名称', :m_property => m_tab_title, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                 {:title => '备注', :m_property => m_tab_note, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                 {:title => '只读', :m_property => m_tab_read_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                 {:title => '实体种类', :m_property => m_tab_entity_kind_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                 {:title => '排序', :m_property => m_tab_seq, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                 {:title => '是否激活', :m_property => m_tab_actived_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1 },
                                 {:title => '所属窗口', :m_property => m_tab_window_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                 {:title => '对应实体', :m_property => m_tab_entity_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                 {:title => '所属组织', :m_property => m_tab_org_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                 {:title => '创建人', :m_property => m_tab_createdby_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                 {:title => '更新人', :m_property => m_tab_updatedby_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                 {:title => '帮助', :m_property => m_tab_help, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1}
                                ])
    fastui_tab.m_fields.create([{:title => 'ID', :m_property => m_tab_id,:displayed => state_true,:read =>state_true,
                                 :entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '名称', :m_property => m_tab_title,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 2,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '备注', :m_property => m_tab_note,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 3,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '只读', :m_property => m_tab_read_id,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 4,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '实体种类', :m_property => m_tab_entity_kind_id,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 5,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '排序', :m_property => m_tab_seq,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 6,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '是否激活', :m_property => m_tab_actived_id,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 7,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '所属窗口', :m_property => m_tab_window_id,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 8,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '对应实体', :m_property => m_tab_entity_id,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 9,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '所属组织', :m_property => m_tab_org_id,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 10,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '创建人', :m_property => m_tab_createdby_id,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 11,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '更新人', :m_property => m_tab_updatedby_id,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 12,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                {:title => '帮助', :m_property => m_tab_help,:displayed => state_true,:read =>state_false,
                                 :entity_kind => entity_kind_sys,:seq => 13,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                               ])
    fastui_field = fastui.m_tabs.create(:title => '字段', :m_entity => m_field,:read => state_true,:entity_kind => entity_kind_sys,
                                        :seq => 3,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1)
    fastui_field.m_columns.create([{:title => 'ID', :m_property => m_field_id, :width => 35,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '名称', :m_property => m_field_title, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '备注', :m_property => m_field_note, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '显示', :m_property => m_field_displayed, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '只读', :m_property => m_field_read, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '实体种类', :m_property => m_field_entity_kind_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '排序', :m_property => m_field_seq, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '是否激活', :m_property => m_field_actived_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '所属组织', :m_property => m_field_org_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '创建人', :m_property => m_field_createdby_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '更新人', :m_property => m_field_updatedby_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '帮助', :m_property => m_field_help, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1}
                                  ])

    fastui_field.m_fields.create([{:title => 'ID', :m_property => m_field_id,:displayed => state_true,
                                   :read =>state_true,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                  {:title => '名称', :m_property => m_field_title,:displayed => state_true,:read =>state_false,
                                   :entity_kind => entity_kind_sys,:seq => 2,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                  {:title => '备注', :m_property => m_field_note,:displayed => state_true,:read =>state_false,
                                   :entity_kind => entity_kind_sys,:seq => 3,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                  {:title => '显示', :m_property => m_field_displayed,:displayed => state_true,:read =>state_false,
                                   :entity_kind => entity_kind_sys,:seq => 4,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                  {:title => '只读', :m_property => m_field_read,:displayed => state_true,:read =>state_false,
                                   :entity_kind => entity_kind_sys,:seq => 5,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                  {:title => '实体种类', :m_property => m_field_entity_kind_id,:displayed => state_true,:read =>state_false,
                                   :entity_kind => entity_kind_sys,:seq => 6,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                  {:title => '排序', :m_property => m_field_seq,:displayed => state_true,:read =>state_false,
                                   :entity_kind => entity_kind_sys,:seq => 7,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                  {:title => '是否激活', :m_property => m_field_actived_id,:displayed => state_true,:read =>state_false,
                                   :entity_kind => entity_kind_sys,:seq => 8,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                  {:title => '所属组织', :m_property => m_field_org_id,:displayed => state_true,:read =>state_false,
                                   :entity_kind => entity_kind_sys,:seq => 9,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                  {:title => '创建人', :m_property => m_field_createdby_id,:displayed => state_true,:read =>state_false,
                                   :entity_kind => entity_kind_sys,:seq => 10,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                  {:title => '更新人', :m_property => m_field_updatedby_id,:displayed => state_true,:read =>state_false,
                                   :entity_kind => entity_kind_sys,:seq => 11,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                  {:title => '帮助', :m_property => m_field_help,:displayed => state_true,:read =>state_false,
                                   :entity_kind => entity_kind_sys,:seq => 12,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1}
                                 ])


    fastui_column = fastui.m_tabs.create(:title => '表列', :m_entity => m_column,:read =>state_true,:entity_kind => entity_kind_sys,
                                         :seq => 4,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1)
    fastui_column.m_columns.create([{:title => 'ID', :m_property => m_column_id, :width => 35,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                    {:title => '名称', :m_property => m_column_title, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                    {:title => '备注', :m_property => m_column_note, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                    {:title => '列宽度', :m_property => m_column_width, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                    {:title => '实体种类', :m_property => m_column_entity_kind_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                    {:title => '排序', :m_property => m_column_seq, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                    {:title => '是否激活', :m_property => m_column_actived_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                    {:title => '所属组织', :m_property => m_column_org_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                    {:title => '创建人', :m_property => m_column_createdby_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                    {:title => '更新人', :m_property => m_column_updatedby_id, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                    {:title => '帮助', :m_property => m_column_help, :width => 75,:entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1}
                                   ])

    fastui_column.m_fields.create([{:title => 'ID', :m_property => m_column_id,:displayed => state_true,:read =>state_true,
                                    :entity_kind => entity_kind_sys,:seq => 1,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '名称', :m_property => m_column_title,:displayed => state_true,:read =>state_false,
                                    :entity_kind => entity_kind_sys,:seq => 2,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '备注', :m_property => m_column_note,:displayed => state_true,:read =>state_false,
                                    :entity_kind => entity_kind_sys,:seq => 3,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '列宽度', :m_property => m_column_width,:displayed => state_true,:read =>state_false,
                                    :entity_kind => entity_kind_sys,:seq => 4,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '实体种类', :m_property => m_column_entity_kind_id,:displayed => state_true,:read =>state_false,
                                    :entity_kind => entity_kind_sys,:seq => 5,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '排序', :m_property => m_column_seq,:displayed => state_true,:read =>state_false,
                                    :entity_kind => entity_kind_sys,:seq => 6,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '是否激活', :m_property => m_column_actived_id,:displayed => state_true,:read =>state_false,
                                    :entity_kind => entity_kind_sys,:seq => 7,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '所属组织', :m_property => m_column_org_id,:displayed => state_true,:read =>state_false,
                                    :entity_kind => entity_kind_sys,:seq => 8,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '创建人', :m_property => m_column_createdby_id,:displayed => state_true,:read =>state_false,
                                    :entity_kind => entity_kind_sys,:seq => 9,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '更新人', :m_property => m_column_updatedby_id,:displayed => state_true,:read =>state_false,
                                    :entity_kind => entity_kind_sys,:seq => 10,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1},
                                   {:title => '帮助', :m_property => m_column_help,:displayed => state_true,:read =>state_false,
                                    :entity_kind => entity_kind_sys,:seq => 11,:actived => state_true,:org => org_system,:createdby => person1,:updatedby => person1}
                                  ])

    menu_sys = Fastui::MMenu.new({:name => 'menu_sys', :title => '系统菜单'})
    menu_sys_tools = Fastui::MMenuItem.create({:name => 'sys_tools', :title => '系统工具',:m_menu => menu_sys})
    menu_sys_tools_fastui = menu_sys_tools.children.create({:name => 'sys_fastui', :title => 'FastUI'})



  end
end
