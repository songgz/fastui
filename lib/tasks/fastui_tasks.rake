# encoding: utf-8
#desc "Explaining what the task does"
namespace :fastui do
  desc "init fastui system data"
  task :system_data => :environment do

    v_number = Fastui::MDataType.create({:name => 'VNumber', :title => '整型'})
    v_date = Fastui::MDataType.create({:name => 'VDate', :title => '日期'})
    v_text = Fastui::MDataType.create({:name => 'VText', :title => '字符串'})
    v_htmleditor = Fastui::MDataType.create({:name => 'VHtmlEditor', :title => '文本编辑器'})
    v_textarea = Fastui::MDataType.create({:name => 'VTextArea', :title => '文本'})
    v_checkbox = Fastui::MDataType.create({:name => 'VCheckBox', :title => '选择框'})
    v_combobox = Fastui::MDataType.create({:name => 'VComboBox', :title => '下拉框'})
    v_defaultColumn = Fastui::MDataType.create({:name => 'VDefaultColumn', :title => 'grid默认列'})

    boolean_value = Fastui::MGlossary.create({:name => 'boolean_value', :title => '布尔值'})
    boolean_value.m_glossary_items.create([
                                              {:name => 'false', :title => '否'},
                                              {:name => 'true', :title => '是'}
                                          ])

    access_level = Fastui::MGlossary.create({:name => 'access_level', :title => '访问级别'})
    access_level.m_glossary_items.create([
                                             {:name => 'system', :title => '系统级别'},
                                             {:name => 'org', :title => '组织级别'},
                                             {:name => 'dept', :title => '部门级别'}
                                         ])

    entity_kind = Fastui::MGlossary.create({:name => 'entity_kind', :title => '实体种类'})
    entity_kind_sys = entity_kind.m_glossary_items.create({:name => 'sys', :title => '系统实体'})
    entity_kind_app = entity_kind.m_glossary_items.create({:name => 'app', :title => '应用实体'})

    m_window = Fastui::MEntity.create({:name => 'm_window', :title => '窗口', :entity_kind => entity_kind_sys})
    m_window_id = m_window.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number})
    m_window_title = m_window.m_properties.create({:name => 'title', :title => '标题', :refable => v_text})
    m_window_note = m_window.m_properties.create({:name => 'note', :title => '备注', :refable => v_text})
    m_window_entity_kind_id = m_window.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind})

    m_tab = Fastui::MEntity.create({:name => 'm_tab', :title => '标签', :entity_kind => entity_kind_sys})
    m_tab_id = m_tab.m_properties.create({:name => 'id', :title => 'ID', :refable => v_number})
    m_tab_title = m_tab.m_properties.create({:name => 'title', :title => '标题', :refable => v_text})
    m_tab_note = m_tab.m_properties.create({:name => 'note', :title => '备注', :refable => v_text})
    m_tab_read_id = m_tab.m_properties.create({:name => 'read_id', :title => '只读', :refable => boolean_value})
    m_tab_entity_kind_id = m_tab.m_properties.create({:name => 'entity_kind_id', :title => '实体种类', :refable => entity_kind})


    fastui = Fastui::MWindow.create(:title => 'FastUI')
    fastui_window = fastui.m_tabs.create(:title => '窗口', :m_entity => m_window)
    fastui_tab = fastui.m_tabs.create(:title => '标签', :m_entity => m_tab)
    #t2.m_entity = entity_m_tab
    ##t2.m_fields.create(:title => '标题')
    #
    #t3 = w.m_tabs.create(:title => '字段')
    #t3.m_fields.create(:title => '标题')
    #
    #t4 = w.m_tabs.create(:title => '表格列属性')
    #t4.m_fields.create(:title => '标题')
    #
    #t4 = w.m_tabs.create(:title => '标签Action')
    #t4.m_fields.create(:title => '标题')

    #col1 = Fastui::MColumn.create({:title => 'ID', :name => 'id',:width => 35})
    #col1.m_property = window_property0
    #col2= Fastui::MColumn.create({:title => '窗口名称', :name => 'title',:width => 75})
    #col2.m_property = window_property1
    #t1.m_columns = [col1,col2]

    fastui_window.m_columns.create([
                                       {:title => 'ID', :m_property => m_window_id, :width => 35},
                                       {:title => '窗口名称', :m_property => m_window_title, :width => 75}
                                   ])

    fastui_window.m_fields.create([
                                      {:title => 'ID', :m_property => m_window_id},
                                      {:title => '窗口名称', :m_property => m_window_title}
                                  ])

    fastui_tab.m_columns.create([{:title => 'ID', :m_property => m_tab_id, :width => 35},
                                 {:title => '标签名称', :m_property => m_tab_title, :width => 75},
                                 {:title => '备注', :m_property => m_tab_note, :width => 75},
                                 {:title => '只读', :m_property => m_tab_read_id, :width => 75}
                                ])

    #t2.m_columns.create([{:title => 'ID', :data_index => 'id', :xtype => 'VDefaultColumn', :width => 35},
    #                     {:title => '标签名称', :data_index => 'title', :xtype => 'VDefaultColumn', :width => 75},
    #                    #{:title => 'Model',:data_index => 'model_class',:association => 'm_model',:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                    #{:title => '所属窗口',:data_index => 'm_window_name',:association => 'm_window',:association_name => 'name',:m_attr => m_tab.m_attrs.find_by_name('m_window_id'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                    #{:title => '所属Tab',:data_index => 'm_tab_name',:association => 'included_tab',:association_name => 'name',:m_attr => m_tab.m_attrs.find_by_name('included_tab_id'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75}
    #                    ])
    fastui_tab.m_fields.create([{:title => 'ID', :m_property => m_tab_id},
                                {:title => '标签名称', :m_property => m_tab_title},
                                {:title => '备注', :m_property => m_tab_note},
                                {:title => '只读', :m_property => m_tab_read_id}
                               #                   #{:title => 'Model',:vfield => 'VLongCombo',:m_attr => 'model_class',:disabled => false,:order_by => 3,:position => 1,:desc => '模型名，此标签的对应的模型',:help => ''},
                               #                   #{:title => '表单显示列数',:attr => 'layout',:vfield => 'VNumber',:m_attr => m_tab.m_attrs.find_by_name('layout'),:disabled => false,:order_by => 4,:position => 1,:desc => '表单显示时，一行中属性的个数',:help => ''},
                               #                   #{:title => '所属窗口',:attr => 'm_window_id',:vfield => 'VCombo',:m_attr => m_tab.m_attrs.find_by_name('m_window_id'),:disabled => false,:order_by => 5,:position => 1,:desc => '此标签所属的窗口',:help => ''},
                               #                   #{:title => '关联的标签',:attr => 'included_tab_id',:vfield => 'VIncludedTabsCombo',:m_attr => m_tab.m_attrs.find_by_name('included_tab_id'),:disabled => false,:order_by => 6,:position => 1,:desc => '在点击时，次标签的上一级链接地址',:help => ''},
                               #                   #{:title => '描述',:attr => 'desc',:m_attr => m_tab.m_attrs.find_by_name('desc'),:vfield => 'VString',:disabled => false,:order_by => 7,:position => 1,:desc => '描述',:help => ''},
                               #                   #{:title => '帮助',:attr => 'help',:vfield => 'VLongString',:m_attr => m_tab.m_attrs.find_by_name('help'),:disabled => false,:order_by => 8,:position => 1,:desc => '帮助信息',:help => ''}
                               ])


  end

end
