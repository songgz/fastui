# encoding: utf-8
#desc "Explaining what the task does"
namespace :fastui do
  desc "init fastui 'system' data"
  task :system_data => :environment do

    org_system = Fastui::MOrg.create({:name => 'system', :title => '系统组织'})
    person1 = Fastui::MPerson.create({:name => 'Administrator', :title => '系统管理员'})
    Fastui::Env.ctx.set('g_person_id', person1.id)
    Fastui::Env.ctx.set('g_person_id', org_system.id)

    v_datatype = Fastui::MDatatype

    v_number = Fastui::MNumber.create({:name => 'VNumber', :title => '整型'})
    v_date = Fastui::MDate.create({:name => 'VDate', :title => '日期'})
    v_text = Fastui::MText.create({:name => 'VText', :title => '字符串'})
    v_htmleditor = Fastui::MHtmlEditor.create({:name => 'VHtmlEditor', :title => '文本编辑器'})
    v_textarea = Fastui::MTextArea.create({:name => 'VTextArea', :title => '文本'})
    v_checkbox = Fastui::MCheckBox.create({:name => 'VCheckBox', :title => '选择框'})
    v_combobox = Fastui::MComboBox.create({:name => 'VComboBox', :title => '下拉框'})
    v_yesorno = Fastui::MYesOrNo.create({:name => 'VYesOrNo', :title => '是否'})

    access_level = Fastui::MList.create({:name => 'access_level', :title => '访问级别'})
    access_level.m_list_items.create([{:name => 'system', :title => '系统级别'}, {:name => 'org', :title => '组织级别'}, {:name => 'dept', :title => '部门级别'}])

    entity_kind = Fastui::MList.create({:name => 'entity_kind', :title => '实体种类'})
    entity_kind.m_list_items.create([{:name => 'sys', :title => '系统实体'}, {:name => 'app', :title => '应用实体'}])

    window_kind = Fastui::MList.create({:name => 'window_kind', :title => '窗体种类'})
    window_kind.m_list_items.create([{:name => 'maintain', :title => '维护'}, {:name => 'transaction', :title => '事务'}, {:name => 'query', :title => '查询'}])


    m_person = Fastui::MEntity.create({:name => 'Fastui::MPerson', :title => '人员', :access_level => 'system', :entity_kind => 'sys',
                                       :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity = Fastui::MEntity.create({:name => 'Fastui::MEntity', :title => '实体', :access_level => 'system', :entity_kind => 'sys',
                                       :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property = Fastui::MEntity.create({:name => 'Fastui::MProperty', :title => '属性', :access_level => 'system', :entity_kind => 'sys',
                                         :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_org = Fastui::MEntity.create({:name => 'Fastui::MOrg', :title => '组织', :access_level => 'system', :entity_kind => 'sys',
                                    :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu = Fastui::MEntity.create({:name => 'Fastui::MMenu', :title => '菜单', :access_level => 'system', :entity_kind => 'sys',
                                     :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_datatype = Fastui::MEntity.create({:name => 'Fastui::MDatatype', :title => '数据类型', :access_level => 'system', :entity_kind => 'sys',
                                         :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})


    m_relation_org = Fastui::MRelation.create({:m_entity => m_org, :name => 'Fastui::MOrg', :title => '组织', :access_level => 'system', :entity_kind => 'sys',
                                               :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_relation_person = Fastui::MRelation.create({:m_entity => m_person, :name => 'Fastui::MPerson', :title => '人员', :access_level => 'system', :entity_kind => 'sys',
                                                  :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_relation_entity = Fastui::MRelation.create({:m_entity => m_entity, :name => 'Fastui::MEntity', :title => '实体', :access_level => 'system', :entity_kind => 'sys',
                                                  :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_relation_property = Fastui::MRelation.create({:m_entity => m_property, :name => 'Fastui::MProperty', :title => '属性', :access_level => 'system', :entity_kind => 'sys',
                                                    :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_relation_menu = Fastui::MRelation.create({:m_entity => m_menu, :name => 'Fastui::MMenu', :title => '菜单', :access_level => 'system', :entity_kind => 'sys',
                                                :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_relation_datatype = Fastui::MRelation.create({:m_entity => m_datatype, :name => 'Fastui::MDatatype', :title => '数据类型', :access_level => 'system', :entity_kind => 'sys',
                                                    :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})


    attr = {entity_kind: 'sys', seq: 1, actived: true, org: org_system, createdby: person1, updatedby: person1}
    mwin = Fastui::MEntity.create({name: 'Fastui::MWindow', title: '窗口', access_level: 'system'}.merge(attr)) do |ent|
      ent.m_properties.build([{name: 'id', title: 'ID', m_datatype: v_number},
                              {name: 'title', title: '标题', m_datatype: v_text},
                              {:name => 'print_text', :title => '打印文本', :m_datatype => v_text},
                              {:name => 'name', :title => '标识', :m_datatype => v_text},
                              {:name => 'note', :title => '备注', :m_datatype => v_textarea},
                              {:name => 'entity_kind', :title => '实体种类', :m_datatype => entity_kind},
                              {:name => 'window_kind', :title => '窗体种类', :m_datatype => window_kind},
                              {:name => 'seq', :title => '排序', :m_datatype => v_number},
                              {:name => 'actived', :title => '是否激活', :m_datatype => v_yesorno},
                              {:name => 'help', :title => '帮助', :m_datatype => v_textarea},
                              {:name => 'org_id', :title => '所属组织', :m_datatype => m_relation_org},
                              {:name => 'createdby_id', :title => '创建人', :m_datatype => m_relation_person},
                              {:name => 'updatedby_id', :title => '更新人', :m_datatype => m_relation_person}
                             ].map { |a| a.merge(attr) })

    end
    m_relation_window = Fastui::MRelation.create({:m_entity => mwin, :name => 'Fastui::MWindow', :title => '窗口', :access_level => 'system'}.merge(attr))

    mtab = Fastui::MEntity.create({:name => 'Fastui::MTab', :title => '标签', :access_level => 'system'}.merge(attr))
    m_relation_tab = Fastui::MRelation.create({:m_entity => mtab, :name => 'Fastui::MTab', :title => '标签', :access_level => 'system'}.merge(attr))
    mtab.m_properties.create([{:name => 'id', :title => 'ID', :m_datatype => v_number},
                              {:name => 'title', :title => '标题', :m_datatype => v_text},
                              {:name => 'print_text', :title => '打印文本', :m_datatype => v_text},
                              {:name => 'name', :title => '标识', :m_datatype => v_text},
                              {:name => 'note', :title => '备注', :m_datatype => v_textarea},
                              {:name => 'ro', :title => '只读', :m_datatype => v_yesorno},
                              {:name => 'entity_kind', :title => '实体种类', :m_datatype => entity_kind},
                              {:name => 'seq', :title => '排序', :m_datatype => v_number},
                              {:name => 'actived', :title => '是否激活', :m_datatype => v_yesorno},
                              {:name => 'help', :title => '帮助', :m_datatype => v_textarea},
                              {:name => 'm_window_id', :title => '所属窗口', :m_datatype => m_relation_window},
                              {:name => 'included_tab_id', :title => '依赖标签', :m_datatype => m_relation_tab},
                              {:name => 'm_entity_id', :title => 'Model', :m_datatype => m_relation_entity},
                              {:name => 'org_id', :title => '所属组织', :m_datatype => m_relation_org},
                              {:name => 'createdby_id', :title => '创建人', :m_datatype => m_relation_person},
                              {:name => 'updatedby_id', :title => '更新人', :m_datatype => m_relation_person}].map { |a| a.merge(attr) })

    mfield = Fastui::MEntity.create({:name => 'Fastui::MField', :title => '字段', :access_level => 'system'}.merge(attr)) do |field_ent|
      field_ent.m_properties.build([{:name => 'id', :title => 'ID', :m_datatype => v_number},
                                    {:name => 'title', :title => '标题', :m_datatype => v_text},
                                    {:name => 'print_text', :title => '打印文本', :m_datatype => v_text},
                                    {:name => 'name', :title => '标识', :m_datatype => v_text},
                                    {:name => 'note', :title => '备注', :m_datatype => v_textarea},
                                    {:name => 'm_property_id', :title => '所属属性', :m_datatype => m_relation_property},
                                    {:name => 'displayed', :title => '是否显示', :m_datatype => v_yesorno},
                                    {:name => 'ro', :title => '是否只读', :m_datatype => v_yesorno},
                                    {:name => 'entity_kind', :title => '实体种类', :m_datatype => entity_kind},
                                    {:name => 'seq', :title => '排序', :m_datatype => v_number},
                                    {:name => 'actived', :title => '是否激活', :m_datatype => v_yesorno},
                                    {:name => 'org_id', :title => '所属组织', :m_datatype => m_relation_org},
                                    {:name => 'm_tab_id', :title => '依赖标签', :m_datatype => m_relation_tab},
                                    {:name => 'createdby_id', :title => '创建人', :m_datatype => m_relation_person},
                                    {:name => 'updatedby_id', :title => '更新人', :m_datatype => m_relation_person},
                                    {:name => 'help', :title => '帮助', :m_datatype => v_textarea}].map { |a| a.merge(attr) })
    end
    mcolumn = Fastui::MEntity.create({:name => 'Fastui::MColumn', :title => '表列', :access_level => 'system'}.merge(attr)) do |column_ent|
      column_ent.m_properties.build([{:name => 'id', :title => 'ID', :m_datatype => v_number},
                                     {:name => 'title', :title => '标题', :m_datatype => v_text},
                                     {:name => 'print_text', :title => '打印文本', :m_datatype => v_text},
                                     {:name => 'name', :title => '标识', :m_datatype => v_text},
                                     {:name => 'note', :title => '备注', :m_datatype => v_textarea},
                                     {:name => 'm_property_id', :title => '所属属性', :m_datatype => m_relation_property},
                                     {:name => 'width', :title => '列宽度', :m_datatype => v_number},
                                     {:name => 'entity_kind', :title => '实体种类', :m_datatype => entity_kind},
                                     {:name => 'seq', :title => '排序', :m_datatype => v_number},
                                     {:name => 'actived', :title => '是否激活', :m_datatype => v_yesorno},
                                     {:name => 'org_id', :title => '所属组织', :m_datatype => m_relation_org},
                                     {:name => 'm_tab_id', :title => '依赖标签', :m_datatype => m_relation_tab},
                                     {:name => 'createdby_id', :title => '创建人', :m_datatype => m_relation_person},
                                     {:name => 'updatedby_id', :title => '更新人', :m_datatype => m_relation_person},
                                     {:name => 'help', :title => '帮助', :m_datatype => v_textarea}].map { |a| a.merge(attr) })
    end

    win = Fastui::MWindow.create({title: 'FastUI', window_kind: 'maintain'}.merge(attr))
    fastui_window = win.m_tabs.create({title: '窗口', m_entity: mwin, ro: true}.merge(attr)) do |win_tab|
      win_tab.m_fields.build([{:title => 'ID', :m_property => mwin.prop_by('id'), :displayed => true, :ro => true},
                              {:title => '标题', :m_property => mwin.prop_by('title'), :displayed => true, :ro => false},
                              {:title => '打印文本', :m_property => mwin.prop_by('print_text'), :displayed => true, :ro => false},
                              {:title => '标识', :m_property => mwin.prop_by('name'), :displayed => true, :ro => false},
                              {:title => '备注', :m_property => mwin.prop_by('note'), :displayed => true, :ro => false},
                              {:title => '窗体种类', :m_property => mwin.prop_by('window_kind'), :displayed => true, :ro => false},
                              {:title => '实体种类', :m_property => mwin.prop_by('entity_kind'), :displayed => true, :ro => false},
                              {:title => '排序', :m_property => mwin.prop_by('seq'), :displayed => true, :ro => false},
                              {:title => '是否激活', :m_property => mwin.prop_by('actived'), :displayed => true, :ro => false},
                              {:title => '所属组织', :m_property => mwin.prop_by('org_id'), :displayed => true, :ro => false},
                              {:title => '创建人', :m_property => mwin.prop_by('createdby_id'), :displayed => true, :ro => false},
                              {:title => '更新人', :m_property => mwin.prop_by('updatedby_id'), :displayed => true, :ro => false},
                              {:title => '帮助', :m_property => mwin.prop_by('help'), :displayed => true, :ro => false}].map { |a| a.merge(attr) })
      win_tab.m_columns.build([{:title => 'ID', :m_property => mwin.prop_by('id'), :width => 35},
                               {:title => '标题', :m_property => mwin.prop_by('title'), :width => 75},
                               {:title => '打印文本', :m_property => mwin.prop_by('print_text'), :width => 75},
                               {:title => '标识', :m_property => mwin.prop_by('name'), :width => 75},
                               {:title => '备注', :m_property => mwin.prop_by('note'), :width => 75},
                               {:title => '窗体种类', :m_property => mwin.prop_by('window_kind'), :width => 75},
                               {:title => '实体种类', :m_property => mwin.prop_by('entity_kind'), :width => 75},
                               {:title => '排序', :m_property => mwin.prop_by('seq'), :width => 75},
                               {:title => '是否激活', :m_property => mwin.prop_by('actived'), :width => 75},
                               {:title => '所属组织', :m_property => mwin.prop_by('org_id'), :width => 75},
                               {:title => '创建人', :m_property => mwin.prop_by('updatedby_id'), :width => 75},
                               {:title => '更新人', :m_property => mwin.prop_by('updatedby_id'), :width => 75},
                               {:title => '帮助', :m_property => mwin.prop_by('help'), :width => 75}
                              ].map { |a| a.merge(attr) })
    end
    fastui_tab = win.m_tabs.create({title: '标签', m_entity: mtab, ro: true, included_tab: fastui_window}.merge(attr)) do |t_tab|
      t_tab.m_fields.build([{:title => 'ID', :m_property => mtab.prop_by('id'), :displayed => true, :ro => true},
                            {:title => '标题', :m_property => mtab.prop_by('title'), :displayed => true, :ro => false},
                            {:title => '打印文本', :m_property => mtab.prop_by('print_text'), :displayed => true, :ro => false},
                            {:title => '标识', :m_property => mtab.prop_by('name'), :displayed => true, :ro => false},
                            {:title => '备注', :m_property => mtab.prop_by('note'), :displayed => true, :ro => false},
                            {:title => '只读', :m_property => mtab.prop_by('ro'), :displayed => true, :ro => false},
                            {:title => '实体种类', :m_property => mtab.prop_by('entity_kind'), :displayed => true, :ro => false},
                            {:title => '排序', :m_property => mtab.prop_by('seq'), :displayed => true, :ro => false},
                            {:title => '是否激活', :m_property => mtab.prop_by('actived'), :displayed => true, :ro => false},
                            {:title => '所属窗口', :m_property => mtab.prop_by('m_window_id'), :displayed => true, :ro => false},
                            {:title => '依赖标签', :m_property => mtab.prop_by('included_tab_id'), :displayed => true, :ro => false},
                            {:title => '所属实体', :m_property => mtab.prop_by('m_entity_id'), :displayed => true, :ro => false},
                            {:title => '所属组织', :m_property => mtab.prop_by('org_id'), :displayed => true, :ro => false},
                            {:title => '创建人', :m_property => mtab.prop_by('createdby_id'), :displayed => true, :ro => false},
                            {:title => '更新人', :m_property => mtab.prop_by('updatedby_id'), :displayed => true, :ro => false},
                            {:title => '帮助', :m_property => mtab.prop_by('help'), :displayed => true, :ro => false}
                           ].map { |a| a.merge(attr) })
      t_tab.m_columns.build([{:title => 'ID', :m_property => mtab.prop_by('id'), :width => 35},
                             {:title => '标题', :m_property => mtab.prop_by('title'), :width => 75},
                             {:title => '打印文本', :m_property => mtab.prop_by('print_text'), :width => 75},
                             {:title => '标识', :m_property => mtab.prop_by('name'), :width => 75},
                             {:title => '备注', :m_property => mtab.prop_by('note'), :width => 75},
                             {:title => '只读', :m_property => mtab.prop_by('ro'), :width => 75},
                             {:title => '实体种类', :m_property => mtab.prop_by('entity_kind'), :width => 75},
                             {:title => '排序', :m_property => mtab.prop_by('seq'), :width => 75},
                             {:title => '是否激活', :m_property => mtab.prop_by('actived'), :width => 75},
                             {:title => '所属窗口', :m_property => mtab.prop_by('m_window_id'), :width => 75},
                             {:title => '依赖标签', :m_property => mtab.prop_by('included_tab_id'), :width => 75},
                             {:title => '所属实体', :m_property => mtab.prop_by('m_entity_id'), :width => 75},
                             {:title => '所属组织', :m_property => mtab.prop_by('org_id'), :width => 75},
                             {:title => '创建人', :m_property => mtab.prop_by('createdby_id'), :width => 75},
                             {:title => '更新人', :m_property => mtab.prop_by('updatedby_id'), :width => 75},
                             {:title => '帮助', :m_property => mtab.prop_by('help'), :width => 75}
                            ].map { |a| a.merge(attr) })
    end
    win.m_tabs.create({:title => '字段', :m_entity => mfield, :ro => true, :included_tab => fastui_tab}.merge(attr)) do |field_tab|
      field_tab.m_fields.build([{:title => 'ID', :m_property => mfield.prop_by('id'), :displayed => true, :ro => true},
                                {:title => '标题', :m_property => mfield.prop_by('title'), :displayed => true, :ro => false},
                                {:title => '打印文本', :m_property => mfield.prop_by('print_text'), :displayed => true, :ro => false},
                                {:title => '标识', :m_property => mfield.prop_by('name'), :displayed => true, :ro => false},
                                {:title => '备注', :m_property => mfield.prop_by('note'), :displayed => true, :ro => false},
                                {:title => '所属属性', :m_property => mfield.prop_by('m_property_id'), :displayed => true, :ro => false},
                                {:title => '显示', :m_property => mfield.prop_by('displayed'), :displayed => true, :ro => false},
                                {:title => '只读', :m_property => mfield.prop_by('ro'), :displayed => true, :ro => false},
                                {:title => '实体种类', :m_property => mfield.prop_by('entity_kind'), :displayed => true, :ro => false},
                                {:title => '排序', :m_property => mfield.prop_by('seq'), :displayed => true, :ro => false},
                                {:title => '是否激活', :m_property => mfield.prop_by('actived'), :displayed => true, :ro => false},
                                {:title => '所属组织', :m_property => mfield.prop_by('org_id'), :displayed => true, :ro => false},
                                {:title => '依赖标签', :m_property => mfield.prop_by('m_tab_id'), :displayed => true, :ro => false},
                                {:title => '创建人', :m_property => mfield.prop_by('createdby_id'), :displayed => true, :ro => false},
                                {:title => '更新人', :m_property => mfield.prop_by('updatedby_id'), :displayed => true, :ro => false},
                                {:title => '帮助', :m_property => mfield.prop_by('help'), :displayed => true, :ro => false}].map { |a| a.merge(attr) })
      field_tab.m_columns.build([{:title => 'ID', :m_property => mfield.prop_by('id'), :width => 35},
                                 {:title => '标题', :m_property => mfield.prop_by('title'), :width => 75},
                                 {:title => '打印文本', :m_property => mfield.prop_by('print_text'), :width => 75},
                                 {:title => '标识', :m_property => mfield.prop_by('name'), :width => 75},
                                 {:title => '备注', :m_property => mfield.prop_by('note'), :width => 75},
                                 {:title => '所属属性', :m_property => mfield.prop_by('m_property_id'), :width => 75},
                                 {:title => '显示', :m_property => mfield.prop_by('displayed'), :width => 75},
                                 {:title => '只读', :m_property => mfield.prop_by('ro'), :width => 75},
                                 {:title => '实体种类', :m_property => mfield.prop_by('entity_kind'), :width => 75},
                                 {:title => '排序', :m_property => mfield.prop_by('seq'), :width => 75},
                                 {:title => '是否激活', :m_property => mfield.prop_by('actived'), :width => 75},
                                 {:title => '所属组织', :m_property => mfield.prop_by('org_id'), :width => 75},
                                 {:title => '依赖标签', :m_property => mfield.prop_by('m_tab_id'), :width => 75},
                                 {:title => '创建人', :m_property => mfield.prop_by('createdby_id'), :width => 75},
                                 {:title => '更新人', :m_property => mfield.prop_by('updatedby_id'), :width => 75},
                                 {:title => '帮助', :m_property => mfield.prop_by('help'), :width => 75}].map { |a| a.merge(attr) })
    end
    win.m_tabs.create({:title => '表列', :m_entity => mcolumn, :ro => true, :included_tab => fastui_tab}.merge(attr)) do |column_tab|
      column_tab.m_fields.build([{:title => 'ID', :m_property => mcolumn.prop_by('id'), :displayed => true, :ro => true},
                                 {:title => '标题', :m_property => mcolumn.prop_by('title'), :displayed => true, :ro => false},
                                 {:title => '打印文本', :m_property => mcolumn.prop_by('print_text'), :displayed => true, :ro => false},
                                 {:title => '标识', :m_property => mcolumn.prop_by('name'), :displayed => true, :ro => false},
                                 {:title => '备注', :m_property => mcolumn.prop_by('note'), :displayed => true, :ro => false},
                                 {:title => '所属属性', :m_property => mcolumn.prop_by('m_property_id'), :displayed => true, :ro => false},
                                 {:title => '列宽度', :m_property => mcolumn.prop_by('width'), :displayed => true, :ro => false},
                                 {:title => '实体种类', :m_property => mcolumn.prop_by('entity_kind'), :displayed => true, :ro => false},
                                 {:title => '排序', :m_property => mcolumn.prop_by('seq'), :displayed => true, :ro => false},
                                 {:title => '是否激活', :m_property => mcolumn.prop_by('actived'), :displayed => true, :ro => false},
                                 {:title => '所属组织', :m_property => mcolumn.prop_by('org_id'), :displayed => true, :ro => false},
                                 {:title => '依赖标签', :m_property => mcolumn.prop_by('m_tab_id'), :displayed => true, :ro => false},
                                 {:title => '创建人', :m_property => mcolumn.prop_by('createdby_id'), :displayed => true, :ro => false},
                                 {:title => '更新人', :m_property => mcolumn.prop_by('updatedby_id'), :displayed => true, :ro => false},
                                 {:title => '帮助', :m_property => mcolumn.prop_by('help'), :displayed => true, :ro => false}].map { |a| a.merge(attr) })
      column_tab.m_columns.build([{:title => 'ID', :m_property => mcolumn.prop_by('id'), :width => 35},
                                  {:title => '标题', :m_property => mcolumn.prop_by('title'), :width => 75},
                                  {:title => '打印文本', :m_property => mcolumn.prop_by('print_text'), :width => 75},
                                  {:title => '标识', :m_property => mcolumn.prop_by('name'), :width => 75},
                                  {:title => '备注', :m_property => mcolumn.prop_by('note'), :width => 75},
                                  {:title => '所属属性', :m_property => mcolumn.prop_by('m_property_id'), :width => 75},
                                  {:title => '列宽度', :m_property => mcolumn.prop_by('width'), :width => 75},
                                  {:title => '实体种类', :m_property => mcolumn.prop_by('entity_kind'), :width => 75},
                                  {:title => '排序', :m_property => mcolumn.prop_by('seq'), :width => 75},
                                  {:title => '是否激活', :m_property => mcolumn.prop_by('actived'), :width => 75},
                                  {:title => '所属组织', :m_property => mcolumn.prop_by('org_id'), :width => 75},
                                  {:title => '依赖标签', :m_property => mcolumn.prop_by('m_tab_id'), :width => 75},
                                  {:title => '创建人', :m_property => mcolumn.prop_by('createdby_id'), :width => 75},
                                  {:title => '更新人', :m_property => mcolumn.prop_by('updatedby_id'), :width => 75},
                                  {:title => '帮助', :m_property => mcolumn.prop_by('help'), :width => 75}].map { |a| a.merge(attr) })
    end

    # 导航树 初始化数据

    menu_sys = Fastui::MMenu.create({:name => 'menu_sys', :title => '系统菜单',
                                     :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})


    # 实体
    m_entity_id = m_entity.m_properties.create({:name => 'id', :title => 'ID', :m_datatype => v_number,
                                                :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_title = m_entity.m_properties.create({:name => 'title', :title => '标题', :m_datatype => v_text,
                                                   :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_print_text = m_entity.m_properties.create({:name => 'print_text', :title => '打印文本', :m_datatype => v_text,
                                                        :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_name = m_entity.m_properties.create({:name => 'name', :title => '标识', :m_datatype => v_text,
                                                  :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_note = m_entity.m_properties.create({:name => 'note', :title => '备注', :m_datatype => v_textarea,
                                                  :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_access_level = m_entity.m_properties.create({:name => 'access_level', :title => '访问级别', :m_datatype => access_level,
                                                          :entity_kind => 'sys', :seq => 4, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_entity_kind = m_entity.m_properties.create({:name => 'entity_kind', :title => '实体种类', :m_datatype => entity_kind,
                                                         :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_seq = m_entity.m_properties.create({:name => 'seq', :title => '排序', :m_datatype => v_number,
                                                 :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_actived_id = m_entity.m_properties.create({:name => 'actived', :title => '是否激活', :m_datatype => v_yesorno,
                                                        :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_help = m_entity.m_properties.create({:name => 'help', :title => '帮助', :m_datatype => v_textarea,
                                                  :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_org_id = m_entity.m_properties.create({:name => 'org_id', :title => '所属组织', :m_datatype => m_relation_org,
                                                    :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_createdby_id = m_entity.m_properties.create({:name => 'createdby_id', :title => '创建人', :m_datatype => m_relation_person,
                                                          :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_entity_updatedby_id = m_entity.m_properties.create({:name => 'updatedby_id', :title => '更新人', :m_datatype => m_relation_person,
                                                          :entity_kind => 'sys', :seq => 11, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})

    # 属性
    m_property_id = m_property.m_properties.create({:name => 'id', :title => 'ID', :m_datatype => v_number,
                                                    :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_title = m_property.m_properties.create({:name => 'title', :title => '标题', :m_datatype => v_text,
                                                       :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_print_text = m_property.m_properties.create({:name => 'print_text', :title => '打印文本', :m_datatype => v_text,
                                                            :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_name = m_property.m_properties.create({:name => 'name', :title => '标识', :m_datatype => v_text,
                                                      :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_note = m_property.m_properties.create({:name => 'note', :title => '备注', :m_datatype => v_textarea,
                                                      :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_external_key = m_property.m_properties.create({:name => 'external_key', :title => '外键', :m_datatype => v_text,
                                                              :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_m_datatype = m_property.m_properties.create({:name => 'm_datatype_id', :title => '数据类型', :m_datatype => m_relation_datatype,
                                                            :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_entity_kind = m_property.m_properties.create({:name => 'entity_kind', :title => '实体种类', :m_datatype => entity_kind,
                                                             :entity_kind => 'sys', :seq => 4, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_entity_id = m_property.m_properties.create({:name => 'm_entity_id', :title => '所属实体', :m_datatype => m_relation_entity,
                                                           :entity_kind => 'sys', :seq => 4, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_seq = m_property.m_properties.create({:name => 'seq', :title => '排序', :m_datatype => v_number,
                                                     :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_actived_id = m_property.m_properties.create({:name => 'actived', :title => '是否激活', :m_datatype => v_yesorno,
                                                            :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_help = m_property.m_properties.create({:name => 'help', :title => '帮助', :m_datatype => v_textarea,
                                                      :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_org_id = m_property.m_properties.create({:name => 'org_id', :title => '所属组织', :m_datatype => m_relation_org,
                                                        :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_createdby_id = m_property.m_properties.create({:name => 'createdby_id', :title => '创建人', :m_datatype => m_relation_person,
                                                              :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_property_updatedby_id = m_property.m_properties.create({:name => 'updatedby_id', :title => '更新人', :m_datatype => m_relation_person,
                                                              :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})

    # 菜单
    m_menu_id = m_menu.m_properties.create({:name => 'id', :title => 'ID', :m_datatype => v_number,
                                            :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_title = m_menu.m_properties.create({:name => 'title', :title => '标题', :m_datatype => v_text,
                                               :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_print_text = m_menu.m_properties.create({:name => 'print_text', :title => '打印文本', :m_datatype => v_text,
                                                    :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_name = m_menu.m_properties.create({:name => 'name', :title => '标识', :m_datatype => v_text,
                                              :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_entity_kind = m_menu.m_properties.create({:name => 'entity_kind', :title => '实体种类', :m_datatype => entity_kind,
                                                     :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_seq = m_menu.m_properties.create({:name => 'seq', :title => '排序', :m_datatype => v_number,
                                             :entity_kind => 'sys', :seq => 4, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_actived_id = m_menu.m_properties.create({:name => 'actived', :title => '是否激活', :m_datatype => v_yesorno,
                                                    :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_help = m_menu.m_properties.create({:name => 'help', :title => '帮助', :m_datatype => v_textarea,
                                              :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_org_id = m_menu.m_properties.create({:name => 'org_id', :title => '所属组织', :m_datatype => m_relation_org,
                                                :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_createdby_id = m_menu.m_properties.create({:name => 'createdby_id', :title => '创建人', :m_datatype => m_relation_person,
                                                      :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_updatedby_id = m_menu.m_properties.create({:name => 'updatedby_id', :title => '更新人', :m_datatype => m_relation_person,
                                                      :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})

    # 菜单项
    m_menu_item = Fastui::MEntity.create({:name => 'Fastui::MMenuItem', :title => '菜单项', :access_level => 'system', :entity_kind => 'sys',
                                          :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_id = m_menu_item.m_properties.create({:name => 'id', :title => 'ID', :m_datatype => v_number,
                                                      :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_title = m_menu_item.m_properties.create({:name => 'title', :title => '标题', :m_datatype => v_text,
                                                         :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_print_text = m_menu_item.m_properties.create({:name => 'print_text', :title => '打印文本', :m_datatype => v_text,
                                                              :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_name = m_menu_item.m_properties.create({:name => 'name', :title => '标识', :m_datatype => v_text,
                                                        :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_entity_kind = m_menu_item.m_properties.create({:name => 'entity_kind', :title => '实体种类', :m_datatype => entity_kind,
                                                               :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_m_menu = m_menu_item.m_properties.create({:name => 'm_menu_id', :title => '对应菜单', :m_datatype => m_relation_menu,
                                                          :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_m_window = m_menu_item.m_properties.create({:name => 'm_window_id', :title => '对应窗口', :m_datatype => m_relation_window,
                                                            :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_seq = m_menu_item.m_properties.create({:name => 'seq', :title => '排序', :m_datatype => v_number,
                                                       :entity_kind => 'sys', :seq => 4, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_actived_id = m_menu_item.m_properties.create({:name => 'actived', :title => '是否激活', :m_datatype => v_yesorno,
                                                              :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_help = m_menu_item.m_properties.create({:name => 'help', :title => '帮助', :m_datatype => v_textarea,
                                                        :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_relation_org_id = m_menu_item.m_properties.create({:name => 'org_id', :title => '所属组织', :m_datatype => m_relation_org,
                                                                   :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_createdby_id = m_menu_item.m_properties.create({:name => 'createdby_id', :title => '创建人', :m_datatype => m_relation_person,
                                                                :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_menu_item_updatedby_id = m_menu_item.m_properties.create({:name => 'updatedby_id', :title => '更新人', :m_datatype => m_relation_person,
                                                                :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    # 关联
    m_dt_relation = Fastui::MEntity.create({:name => 'Fastui::MRelation', :title => '关联', :access_level => 'system', :entity_kind => 'sys',
                                            :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_id = m_dt_relation.m_properties.create({:name => 'id', :title => 'ID', :m_datatype => v_number,
                                                          :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_title = m_dt_relation.m_properties.create({:name => 'title', :title => '标题', :m_datatype => v_text,
                                                             :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_print_text = m_dt_relation.m_properties.create({:name => 'print_text', :title => '打印文本', :m_datatype => v_text,
                                                                  :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_note = m_dt_relation.m_properties.create({:name => 'note', :title => '备注', :m_datatype => v_textarea,
                                                            :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_name = m_dt_relation.m_properties.create({:name => 'name', :title => '标识', :m_datatype => v_text,
                                                            :entity_kind => 'sys', :seq => 4, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_entity_id = m_dt_relation.m_properties.create({:name => 'm_entity_id', :title => '所属实体', :m_datatype => m_relation_entity,
                                                                 :entity_kind => 'sys', :seq => 4, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_access_level = m_dt_relation.m_properties.create({:name => 'access_level', :title => '访问级别', :m_datatype => access_level,
                                                                    :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_entity_kind = m_dt_relation.m_properties.create({:name => 'entity_kind', :title => '实体种类', :m_datatype => entity_kind,
                                                                   :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_seq = m_dt_relation.m_properties.create({:name => 'seq', :title => '排序', :m_datatype => v_number,
                                                           :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_actived_id = m_dt_relation.m_properties.create({:name => 'actived', :title => '是否激活', :m_datatype => v_yesorno,
                                                                  :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_help = m_dt_relation.m_properties.create({:name => 'help', :title => '帮助', :m_datatype => v_textarea,
                                                            :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_org_id = m_dt_relation.m_properties.create({:name => 'org_id', :title => '所属组织', :m_datatype => m_relation_org,
                                                              :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_createdby_id = m_dt_relation.m_properties.create({:name => 'createdby_id', :title => '创建人', :m_datatype => m_relation_person,
                                                                    :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_dt_relation_updatedby_id = m_dt_relation.m_properties.create({:name => 'updatedby_id', :title => '更新人', :m_datatype => m_relation_person,
                                                                    :entity_kind => 'sys', :seq => 11, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})

    # 枚举
    m_list = Fastui::MEntity.create({:name => 'Fastui::MList', :title => '枚举', :access_level => 'system', :entity_kind => 'sys',
                                     :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_id = m_list.m_properties.create({:name => 'id', :title => 'ID', :m_datatype => v_number,
                                            :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_title = m_list.m_properties.create({:name => 'title', :title => '标题', :m_datatype => v_text,
                                               :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_print_text = m_list.m_properties.create({:name => 'print_text', :title => '打印文本', :m_datatype => v_text,
                                                    :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_note = m_list.m_properties.create({:name => 'note', :title => '备注', :m_datatype => v_textarea,
                                              :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_name = m_list.m_properties.create({:name => 'name', :title => '标识', :m_datatype => v_text,
                                              :entity_kind => 'sys', :seq => 4, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_entity_kind = m_list.m_properties.create({:name => 'entity_kind', :title => '实体种类', :m_datatype => entity_kind,
                                                     :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_seq = m_list.m_properties.create({:name => 'seq', :title => '排序', :m_datatype => v_number,
                                             :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_actived_id = m_list.m_properties.create({:name => 'actived', :title => '是否激活', :m_datatype => v_yesorno,
                                                    :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_help = m_list.m_properties.create({:name => 'help', :title => '帮助', :m_datatype => v_textarea,
                                              :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_org_id = m_list.m_properties.create({:name => 'org_id', :title => '所属组织', :m_datatype => m_relation_org,
                                                :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_createdby_id = m_list.m_properties.create({:name => 'createdby_id', :title => '创建人', :m_datatype => m_relation_person,
                                                      :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_updatedby_id = m_list.m_properties.create({:name => 'updatedby_id', :title => '更新人', :m_datatype => m_relation_person,
                                                      :entity_kind => 'sys', :seq => 11, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})

    # 枚举项
    m_list_item = Fastui::MEntity.create({:name => 'Fastui::MListItem', :title => '枚举项', :access_level => 'system', :entity_kind => 'sys',
                                          :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_id = m_list_item.m_properties.create({:name => 'id', :title => 'ID', :m_datatype => v_number,
                                                      :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_title = m_list_item.m_properties.create({:name => 'title', :title => '标题', :m_datatype => v_text,
                                                         :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_print_text = m_list_item.m_properties.create({:name => 'print_text', :title => '打印文本', :m_datatype => v_text,
                                                              :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_note = m_list_item.m_properties.create({:name => 'note', :title => '备注', :m_datatype => v_textarea,
                                                        :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_name = m_list_item.m_properties.create({:name => 'name', :title => '标识', :m_datatype => v_text,
                                                        :entity_kind => 'sys', :seq => 4, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_entity_kind = m_list_item.m_properties.create({:name => 'entity_kind', :title => '实体种类', :m_datatype => entity_kind,
                                                               :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_seq = m_list_item.m_properties.create({:name => 'seq', :title => '排序', :m_datatype => v_number,
                                                       :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_actived_id = m_list_item.m_properties.create({:name => 'actived', :title => '是否激活', :m_datatype => v_yesorno,
                                                              :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_help = m_list_item.m_properties.create({:name => 'help', :title => '帮助', :m_datatype => v_textarea,
                                                        :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_relation_org_id = m_list_item.m_properties.create({:name => 'org_id', :title => '所属组织', :m_datatype => m_relation_org,
                                                                   :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_createdby_id = m_list_item.m_properties.create({:name => 'createdby_id', :title => '创建人', :m_datatype => m_relation_person,
                                                                :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    m_list_item_updatedby_id = m_list_item.m_properties.create({:name => 'updatedby_id', :title => '更新人', :m_datatype => m_relation_person,
                                                                :entity_kind => 'sys', :seq => 11, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})


    sys_datatype = Fastui::MWindow.create(:title => '数据类型', :window_kind => 'maintain', :entity_kind => 'sys',
                                          :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1)
    win_dt_relation = sys_datatype.m_tabs.create(:title => '关联', :m_entity => m_dt_relation, :ro => true, :entity_kind => 'sys',
                                                 :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1)

    win_dt_relation.m_columns.create([
                                         {:title => 'ID', :m_property => m_dt_relation_id, :width => 35, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '标题', :m_property => m_dt_relation_title, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '打印文本', :m_property => m_dt_relation_print_text, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '标识', :m_property => m_dt_relation_name, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '关联实体', :m_property => m_dt_relation_entity_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '访问级别', :m_property => m_dt_relation_access_level, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '备注', :m_property => m_dt_relation_note, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '实体种类', :m_property => m_dt_relation_entity_kind, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '排序', :m_property => m_dt_relation_seq, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '是否激活', :m_property => m_dt_relation_actived_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '所属组织', :m_property => m_dt_relation_org_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '创建人', :m_property => m_dt_relation_createdby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '更新人', :m_property => m_dt_relation_updatedby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '帮助', :m_property => m_dt_relation_help, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                                     ])
    win_dt_relation.m_fields.create([
                                        {:title => 'ID', :m_property => m_dt_relation_id, :displayed => true, :ro => true,
                                         :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '标题', :m_property => m_dt_relation_title, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '打印文本', :m_property => m_dt_relation_print_text, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '标识', :m_property => m_dt_relation_name, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '关联实体', :m_property => m_dt_relation_entity_id, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '访问级别', :m_property => m_dt_relation_access_level, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '备注', :m_property => m_dt_relation_note, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '实体种类', :m_property => m_dt_relation_entity_kind, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '排序', :m_property => m_dt_relation_seq, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '是否激活', :m_property => m_dt_relation_actived_id, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '所属组织', :m_property => m_dt_relation_org_id, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '创建人', :m_property => m_dt_relation_createdby_id, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '更新人', :m_property => m_dt_relation_updatedby_id, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                        {:title => '帮助', :m_property => m_dt_relation_help, :displayed => true, :ro => false,
                                         :entity_kind => 'sys', :seq => 11, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                                    ])


    win_list_g = sys_datatype.m_tabs.create(:title => '枚举', :m_entity => m_list, :ro => true, :entity_kind => 'sys',
                                            :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1)

    win_list_g.m_columns.create([
                                    {:title => 'ID', :m_property => m_list_id, :width => 35, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '标题', :m_property => m_list_title, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '打印文本', :m_property => m_list_print_text, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '标识', :m_property => m_list_name, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '备注', :m_property => m_list_note, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '实体种类', :m_property => m_list_entity_kind, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '排序', :m_property => m_list_seq, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '是否激活', :m_property => m_list_actived_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '所属组织', :m_property => m_list_org_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '创建人', :m_property => m_list_createdby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '更新人', :m_property => m_list_updatedby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                    {:title => '帮助', :m_property => m_list_help, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                                ])
    win_list_g.m_fields.create([
                                   {:title => 'ID', :m_property => m_list_id, :displayed => true, :ro => true,
                                    :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '标题', :m_property => m_list_title, :displayed => true, :ro => false,
                                    :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '打印文本', :m_property => m_list_print_text, :displayed => true, :ro => false,
                                    :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '标识', :m_property => m_list_name, :displayed => true, :ro => false,
                                    :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '备注', :m_property => m_list_note, :displayed => true, :ro => false,
                                    :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '实体种类', :m_property => m_list_entity_kind, :displayed => true, :ro => false,
                                    :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '排序', :m_property => m_list_seq, :displayed => true, :ro => false,
                                    :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '是否激活', :m_property => m_list_actived_id, :displayed => true, :ro => false,
                                    :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '所属组织', :m_property => m_list_org_id, :displayed => true, :ro => false,
                                    :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '创建人', :m_property => m_list_createdby_id, :displayed => true, :ro => false,
                                    :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '更新人', :m_property => m_list_updatedby_id, :displayed => true, :ro => false,
                                    :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                   {:title => '帮助', :m_property => m_list_help, :displayed => true, :ro => false,
                                    :entity_kind => 'sys', :seq => 11, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                               ])


    win_list_item = sys_datatype.m_tabs.create(:title => '枚举项', :m_entity => m_list_item, :ro => true, :entity_kind => 'sys', :included_tab => win_list_g,
                                               :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1)

    win_list_item.m_columns.create([
                                       {:title => 'ID', :m_property => m_list_item_id, :width => 35, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '标题', :m_property => m_list_item_title, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '打印文本', :m_property => m_list_item_print_text, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '标识', :m_property => m_list_item_name, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '备注', :m_property => m_list_item_note, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '实体种类', :m_property => m_list_item_entity_kind, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '排序', :m_property => m_list_item_seq, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '是否激活', :m_property => m_list_item_actived_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '所属组织', :m_property => m_list_item_relation_org_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '创建人', :m_property => m_list_item_createdby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '更新人', :m_property => m_list_item_updatedby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '帮助', :m_property => m_list_item_help, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                                   ])
    win_list_item.m_fields.create([
                                      {:title => 'ID', :m_property => m_list_item_id, :displayed => true, :ro => true,
                                       :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '标题', :m_property => m_list_item_title, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '打印文本', :m_property => m_list_item_print_text, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '标识', :m_property => m_list_item_name, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '备注', :m_property => m_list_item_note, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '实体种类', :m_property => m_list_item_entity_kind, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '排序', :m_property => m_list_item_seq, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '是否激活', :m_property => m_list_item_actived_id, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '所属组织', :m_property => m_list_item_relation_org_id, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '创建人', :m_property => m_list_item_createdby_id, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '更新人', :m_property => m_list_item_updatedby_id, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '帮助', :m_property => m_list_item_help, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 11, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                                  ])


    win_entity = Fastui::MWindow.create(:title => '实体', :window_kind => 'maintain', :entity_kind => 'sys',
                                        :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1)
    win_entity_model = win_entity.m_tabs.create(:title => '实体', :m_entity => m_entity, :ro => true, :entity_kind => 'sys',
                                                :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1)
    win_entity_model.m_columns.create([
                                          {:title => 'ID', :m_property => m_entity_id, :width => 35, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '标题', :m_property => m_entity_title, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '打印文本', :m_property => m_entity_print_text, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '标识', :m_property => m_entity_name, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '备注', :m_property => m_entity_note, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '访问级别', :m_property => m_entity_access_level, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '实体种类', :m_property => m_entity_entity_kind, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '排序', :m_property => m_entity_seq, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '是否激活', :m_property => m_entity_actived_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '所属组织', :m_property => m_entity_org_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '创建人', :m_property => m_entity_createdby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '更新人', :m_property => m_entity_updatedby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                          {:title => '帮助', :m_property => m_entity_help, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                                      ])
    win_entity_model.m_fields.create([
                                         {:title => 'ID', :m_property => m_entity_id, :displayed => true, :ro => true,
                                          :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '标题', :m_property => m_entity_title, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '打印文本', :m_property => m_entity_print_text, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '标识', :m_property => m_entity_name, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '备注', :m_property => m_entity_note, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '访问级别', :m_property => m_entity_access_level, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 4, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '实体种类', :m_property => m_entity_entity_kind, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '排序', :m_property => m_entity_seq, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '是否激活', :m_property => m_entity_actived_id, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '所属组织', :m_property => m_entity_org_id, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '创建人', :m_property => m_entity_createdby_id, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '更新人', :m_property => m_entity_updatedby_id, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                         {:title => '帮助', :m_property => m_entity_help, :displayed => true, :ro => false,
                                          :entity_kind => 'sys', :seq => 11, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                                     ])


    win_entity_property = win_entity.m_tabs.create(:title => '属性', :m_entity => m_property, :ro => true, :entity_kind => 'sys', :included_tab => win_entity_model,
                                                   :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1)
    win_entity_property.m_columns.create([
                                             {:title => 'ID', :m_property => m_property_id, :width => 35, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '标题', :m_property => m_property_title, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '打印文本', :m_property => m_property_print_text, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '标识', :m_property => m_property_name, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '外键', :m_property => m_property_external_key, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '备注', :m_property => m_property_note, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '数据类型', :m_property => m_property_m_datatype, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '实体种类', :m_property => m_property_entity_kind, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '所属实体', :m_property => m_property_entity_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '排序', :m_property => m_property_seq, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '是否激活', :m_property => m_property_actived_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '所属组织', :m_property => m_property_org_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '创建人', :m_property => m_property_createdby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '更新人', :m_property => m_property_updatedby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                             {:title => '帮助', :m_property => m_property_help, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                                         ])
    win_entity_property.m_fields.create([
                                            {:title => 'ID', :m_property => m_property_id, :displayed => true, :ro => true,
                                             :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '标题', :m_property => m_property_title, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '打印文本', :m_property => m_property_print_text, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '标识', :m_property => m_property_name, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '外键', :m_property => m_property_external_key, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '备注', :m_property => m_property_note, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '数据类型', :m_property => m_property_m_datatype, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '实体种类', :m_property => m_property_entity_kind, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '所属实体', :m_property => m_property_entity_id, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '排序', :m_property => m_property_seq, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '是否激活', :m_property => m_property_actived_id, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '所属组织', :m_property => m_property_org_id, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '创建人', :m_property => m_property_createdby_id, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '更新人', :m_property => m_property_updatedby_id, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                            {:title => '帮助', :m_property => m_property_help, :displayed => true, :ro => false,
                                             :entity_kind => 'sys', :seq => 11, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                                        ])


    sys_win_menu = Fastui::MWindow.create(:title => '菜单', :window_kind => 'maintain', :entity_kind => 'sys',
                                          :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1)

    sys_menu = sys_win_menu.m_tabs.create(:title => '菜单', :m_entity => m_menu, :ro => true, :entity_kind => 'sys',
                                          :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1)
    sys_menu.m_columns.create([
                                  {:title => 'ID', :m_property => m_menu_id, :width => 35, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '标题', :m_property => m_menu_title, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '打印文本', :m_property => m_menu_print_text, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '标识', :m_property => m_menu_name, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '实体种类', :m_property => m_menu_entity_kind, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '排序', :m_property => m_menu_seq, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '是否激活', :m_property => m_menu_actived_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '所属组织', :m_property => m_menu_org_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '创建人', :m_property => m_menu_createdby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '更新人', :m_property => m_menu_updatedby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                  {:title => '帮助', :m_property => m_menu_help, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                              ])
    sys_menu.m_fields.create([
                                 {:title => 'ID', :m_property => m_menu_id, :displayed => true, :ro => true,
                                  :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '标题', :m_property => m_menu_title, :displayed => true, :ro => false,
                                  :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '打印文本', :m_property => m_menu_print_text, :displayed => true, :ro => false,
                                  :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '标识', :m_property => m_menu_name, :displayed => true, :ro => false,
                                  :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '实体种类', :m_property => m_menu_entity_kind, :displayed => true, :ro => false,
                                  :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '排序', :m_property => m_menu_seq, :displayed => true, :ro => false,
                                  :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '是否激活', :m_property => m_menu_actived_id, :displayed => true, :ro => false,
                                  :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '所属组织', :m_property => m_menu_org_id, :displayed => true, :ro => false,
                                  :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '创建人', :m_property => m_menu_createdby_id, :displayed => true, :ro => false,
                                  :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '更新人', :m_property => m_menu_updatedby_id, :displayed => true, :ro => false,
                                  :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                 {:title => '帮助', :m_property => m_menu_help, :displayed => true, :ro => false,
                                  :entity_kind => 'sys', :seq => 11, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                             ])


    sys_menu_item = sys_win_menu.m_tabs.create(:title => '菜单项', :m_entity => m_menu_item, :ro => true, :entity_kind => 'sys', :included_tab => sys_menu,
                                               :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1)

    sys_menu_item.m_columns.create([
                                       {:title => 'ID', :m_property => m_menu_item_id, :width => 35, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '标题', :m_property => m_menu_item_title, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '打印文本', :m_property => m_menu_item_print_text, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '标识', :m_property => m_menu_item_name, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '实体种类', :m_property => m_menu_item_entity_kind, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '对应菜单', :m_property => m_menu_item_m_menu, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '对应窗口', :m_property => m_menu_item_m_window, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '排序', :m_property => m_menu_item_seq, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '是否激活', :m_property => m_menu_item_actived_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '所属组织', :m_property => m_menu_item_relation_org_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '创建人', :m_property => m_menu_item_createdby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '更新人', :m_property => m_menu_item_updatedby_id, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                       {:title => '帮助', :m_property => m_menu_item_help, :width => 75, :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                                   ])
    sys_menu_item.m_fields.create([
                                      {:title => 'ID', :m_property => m_menu_item_id, :displayed => true, :ro => true,
                                       :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '标题', :m_property => m_menu_item_title, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '打印文本', :m_property => m_menu_item_print_text, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '标识', :m_property => m_menu_item_name, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 2, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '实体种类', :m_property => m_menu_item_entity_kind, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '对应菜单', :m_property => m_menu_item_m_menu, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '对应窗口', :m_property => m_menu_item_m_window, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '排序', :m_property => m_menu_item_seq, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 6, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '是否激活', :m_property => m_menu_item_actived_id, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 7, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '所属组织', :m_property => m_menu_item_relation_org_id, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 8, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '创建人', :m_property => m_menu_item_createdby_id, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 9, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '更新人', :m_property => m_menu_item_updatedby_id, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 10, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1},
                                      {:title => '帮助', :m_property => m_menu_item_help, :displayed => true, :ro => false,
                                       :entity_kind => 'sys', :seq => 11, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1}
                                  ])


    menu_sys_settings = Fastui::MMenuItem.create({:name => 'sys_tools', :title => '系统设置', :m_menu_id => menu_sys.id, :m_window_id => 0,
                                                  :entity_kind => 'sys', :seq => 1, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    menu_sys_settings_sys_datatype = menu_sys_settings.children.create({:name => 'sys_datatype', :title => '数据类型', :m_window_id => sys_datatype.id, :m_menu_id => menu_sys.id,
                                                                        :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    menu_sys_settings_win_entity = menu_sys_settings.children.create({:name => 'win_entity', :title => '实体', :m_window_id => win_entity.id, :m_menu_id => menu_sys.id,
                                                                      :entity_kind => 'sys', :seq => 3, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    menu_sys_settings_fastui = menu_sys_settings.children.create({:name => 'sys_fastui', :title => 'FastUI', :m_window_id => win.id, :m_menu_id => menu_sys.id,
                                                                  :entity_kind => 'sys', :seq => 4, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})
    menu_sys_settings_win_menu = menu_sys_settings.children.create({:name => 'win_menu', :title => '菜单', :m_window_id => sys_win_menu.id, :m_menu_id => menu_sys.id,
                                                                    :entity_kind => 'sys', :seq => 5, :actived => true, :org => org_system, :createdby => person1, :updatedby => person1})

  end
end
