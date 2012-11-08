# encoding: utf-8
#desc "Explaining what the task does"
namespace :fastui do
  desc "init fastui system data"
  task :system_data => :environment do
    boolean = Fastui::MGlossary.create({:name => 'boolean_value', :title => '布尔值'})
    boolean.m_glossary_items = Fastui::MGlossaryItem.create([
                                                                {:name => 'false', :title => '否'},
                                                                {:name => 'true', :title => '是'}
                                                            ])

    access_level = Fastui::MGlossary.create({:name => 'access_level', :title => '访问级别'})
    access_level.m_glossary_items = Fastui::MGlossaryItem.create([
                                                                     {:name => 'system', :title => '系统级别'},
                                                                     {:name => 'org', :title => '组织级别'},
                                                                     {:name => 'dept', :title => '部门级别'}
                                                                 ])

    entity_kind = Fastui::MGlossary.create({:name => 'entity_kind', :title => '实体种类'})
    entity_kind.m_glossary_items = Fastui::MGlossaryItem.create([
                                                                    {:name => 'sys', :title => '系统实体'},
                                                                    {:name => 'app', :title => '应用实体'}
                                                                ])

    v_number = Fastui::MDataType.create({:name => 'VNumber', :title => '整型'})
    v_text = Fastui::MDataType.create({:name => 'VText', :title => '字符串'})
    v_textarea = Fastui::MDataType.create({:name => 'VTextArea', :title => '文本'})
    v_defaultColumn = Fastui::MDataType.create({:name => 'VDefaultColumn', :title => 'grid默认列'})

    entity_m_window = Fastui::MEntity.create({:name => 'm_window', :title => '窗口', :entity_kind => 'sys'
                                             })
    window_property0 = Fastui::MProperty.create({:name => 'id', :title => 'ID',:refable => v_number})
    window_property1 = Fastui::MProperty.create({:name => 'title', :title => '标题',:refable => v_text})
    window_property2 = Fastui::MProperty.create({:name => 'note', :title => '备注',:refable => v_text})
    window_property3 = Fastui::MProperty.create({:name => 'entity_kind', :title => '实体种类', :refable => entity_kind})
    entity_m_window.m_properties = [window_property0,window_property1,window_property2,window_property3]
    #entity_m_window.save
    #.m_properties.create([
    #                                                                    {:name => 'title', :title => '标题',:refable => v_text},
    #                                                                    {:name => 'note', :title => '备注',:refable => v_text},
    #                                                                    {:name => 'entity_kind', :title => '实体种类', :refable => entity_kind}])

    entity_m_tab = Fastui::MEntity.create({:name => 'm_tab', :title => '标签', :entity_kind => 'sys' })
    tab_property1 = Fastui::MProperty.create({:name => 'title', :title => '标题',:refable => v_text})
    tab_property2 = Fastui::MProperty.create({:name => 'note', :title => '备注',:refable => v_text})
    tab_property3 = Fastui::MProperty.create({:name => 'read', :title => '只读', :refable => boolean})
    tab_property4 = Fastui::MProperty.create({:name => 'entity_kind', :title => '实体种类', :refable => entity_kind})
    entity_m_tab.m_properties = [tab_property1,tab_property2,tab_property3,tab_property4]


    w = Fastui::MWindow.create(:title => 'FastUI')

    t1 = w.m_tabs.create(:title => '窗口',:m_entity => entity_m_window)
    #t1.m_entity = entity_m_window
    #t1.m_fields.create(:title => '标题')
    #
    t2 = w.m_tabs.create(:title => '标签',:m_entity => entity_m_tab)
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
    p window_property0
    t1.m_columns.create([{:title => 'ID', :m_property => window_property0, :width => 35},
                         {:title => '窗口名称', :m_property => window_property1, :width => 75}])

    t1.m_fields.create([{:title => 'ID', :m_property => window_property0},
                        {:title => '窗口名称', :m_property => window_property1}])
    #
    #t2.m_columns.create([{:title => 'ID', :data_index => 'id', :xtype => 'VDefaultColumn', :width => 35},
    #                     {:title => '标签名称', :data_index => 'title', :xtype => 'VDefaultColumn', :width => 75},
    #                    #{:title => 'Model',:data_index => 'model_class',:association => 'm_model',:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                    #{:title => '所属窗口',:data_index => 'm_window_name',:association => 'm_window',:association_name => 'name',:m_attr => m_tab.m_attrs.find_by_name('m_window_id'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                    #{:title => '所属Tab',:data_index => 'm_tab_name',:association => 'included_tab',:association_name => 'name',:m_attr => m_tab.m_attrs.find_by_name('included_tab_id'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75}
    #                    ])
    #t2.m_fields.create([{:title => 'ID', :vfield => 'VNumber', :m_attr => 'id'},
    #                    {:title => '标签名称', :vfield => 'VText', :m_attr => 'title'},
    #                   #{:title => 'Model',:vfield => 'VLongCombo',:m_attr => 'model_class',:disabled => false,:order_by => 3,:position => 1,:desc => '模型名，此标签的对应的模型',:help => ''},
    #                   #{:title => '表单显示列数',:attr => 'layout',:vfield => 'VNumber',:m_attr => m_tab.m_attrs.find_by_name('layout'),:disabled => false,:order_by => 4,:position => 1,:desc => '表单显示时，一行中属性的个数',:help => ''},
    #                   #{:title => '所属窗口',:attr => 'm_window_id',:vfield => 'VCombo',:m_attr => m_tab.m_attrs.find_by_name('m_window_id'),:disabled => false,:order_by => 5,:position => 1,:desc => '此标签所属的窗口',:help => ''},
    #                   #{:title => '关联的标签',:attr => 'included_tab_id',:vfield => 'VIncludedTabsCombo',:m_attr => m_tab.m_attrs.find_by_name('included_tab_id'),:disabled => false,:order_by => 6,:position => 1,:desc => '在点击时，次标签的上一级链接地址',:help => ''},
    #                   #{:title => '描述',:attr => 'desc',:m_attr => m_tab.m_attrs.find_by_name('desc'),:vfield => 'VString',:disabled => false,:order_by => 7,:position => 1,:desc => '描述',:help => ''},
    #                   #{:title => '帮助',:attr => 'help',:vfield => 'VLongString',:m_attr => m_tab.m_attrs.find_by_name('help'),:disabled => false,:order_by => 8,:position => 1,:desc => '帮助信息',:help => ''}
    #                   ])


  end

end
