# encoding: utf-8
#desc "Explaining what the task does"
namespace :fastui do
  desc "init fastui system data"
  task :system_data => :environment do
    bl = Fastui::MGlossary.create({:name => 'boolean_value', :title => '布尔值'
                                  }).m_glossary_items.create([
                                                                 {:name => 'false', :title => '否'},
                                                                 {:name => 'true', :title => '是'}
                                                             ]);

    al = Fastui::MGlossary.create({:name => 'access_level', :title => '访问级别'
                                  }).m_glossary_items.create([
                                                                 {:name => 'system', :title => '系统级别'},
                                                                 {:name => 'org', :title => '组织级别'},
                                                                 {:name => 'dept', :title => '部门级别'}
                                                             ]);

    sys = Fastui::MGlossary.create({:name => 'entity_kind', :title => '实体种类'
                                   }).m_glossary_items.create([
                                                                  {:name => 'sys', :title => '系统实体'},
                                                                  {:name => 'app', :title => '应用实体'}
                                                              ]);


    Fastui::MDataType.create([
                                             {:name => 'integer', :title => '整型'},
                                             {:name => 'string', :title => '字符串'},
                                             {:name => 'text', :title => '文本'}
                                         ])

    Fastui::MEntity.create({:name => 'm_window', :title => '窗口',:entity_kind => 'sys'

                           }).m_properties.create([
        {:name => 'title', :title => '标题'},
        {:name => 'note', :title => '备注'},
        {:name => 'kind', :title => '种类',:m_ref_type => sys}

                                                                                      ]);



    w = Fastui::MWindow.create(:title => 'FastUI')

    t1 = w.m_tabs.create(:title => '窗口', :model_class => 'm_window')
    #t1.m_fields.create(:title => '标题')

    t2 = w.m_tabs.create(:title => '标签', :model_class => 'm_tab')
    #t2.m_fields.create(:title => '标题')

    t3 = w.m_tabs.create(:title => '字段')
    t3.m_fields.create(:title => '标题')

    t4 = w.m_tabs.create(:title => '表格列属性')
    t4.m_fields.create(:title => '标题')

    t4 = w.m_tabs.create(:title => '标签Action')
    t4.m_fields.create(:title => '标题')

    t1.m_columns.create([{:title => 'ID', :data_index => 'id', :xtype => 'VDefaultColumn', :sortable => true, :width => 35},
                         {:title => '窗口名称', :data_index => 'title', :xtype => 'VDefaultColumn', :sortable => true, :width => 75}])

    t1.m_fields.create([{:title => 'ID', :m_attr => 'id', :vfield => 'VNumber'},
                        {:title => '窗口名称', :m_attr => 'title', :vfield => 'VText'}])

    t2.m_columns.create([{:title => 'ID', :data_index => 'id', :xtype => 'VDefaultColumn', :width => 35},
                         {:title => '标签名称', :data_index => 'title', :xtype => 'VDefaultColumn', :width => 75},
                        #{:title => 'Model',:data_index => 'model_class',:association => 'm_model',:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
                        #{:title => '所属窗口',:data_index => 'm_window_name',:association => 'm_window',:association_name => 'name',:m_attr => m_tab.m_attrs.find_by_name('m_window_id'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
                        #{:title => '所属Tab',:data_index => 'm_tab_name',:association => 'included_tab',:association_name => 'name',:m_attr => m_tab.m_attrs.find_by_name('included_tab_id'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75}
                        ])
    t2.m_fields.create([{:title => 'ID', :vfield => 'VNumber', :m_attr => 'id'},
                        {:title => '标签名称', :vfield => 'VText', :m_attr => 'title'},
                       #{:title => 'Model',:vfield => 'VLongCombo',:m_attr => 'model_class',:disabled => false,:order_by => 3,:position => 1,:desc => '模型名，此标签的对应的模型',:help => ''},
                       #{:title => '表单显示列数',:attr => 'layout',:vfield => 'VNumber',:m_attr => m_tab.m_attrs.find_by_name('layout'),:disabled => false,:order_by => 4,:position => 1,:desc => '表单显示时，一行中属性的个数',:help => ''},
                       #{:title => '所属窗口',:attr => 'm_window_id',:vfield => 'VCombo',:m_attr => m_tab.m_attrs.find_by_name('m_window_id'),:disabled => false,:order_by => 5,:position => 1,:desc => '此标签所属的窗口',:help => ''},
                       #{:title => '关联的标签',:attr => 'included_tab_id',:vfield => 'VIncludedTabsCombo',:m_attr => m_tab.m_attrs.find_by_name('included_tab_id'),:disabled => false,:order_by => 6,:position => 1,:desc => '在点击时，次标签的上一级链接地址',:help => ''},
                       #{:title => '描述',:attr => 'desc',:m_attr => m_tab.m_attrs.find_by_name('desc'),:vfield => 'VString',:disabled => false,:order_by => 7,:position => 1,:desc => '描述',:help => ''},
                       #{:title => '帮助',:attr => 'help',:vfield => 'VLongString',:m_attr => m_tab.m_attrs.find_by_name('help'),:disabled => false,:order_by => 8,:position => 1,:desc => '帮助信息',:help => ''}
                       ])

    #mtf.m_columns.create([{:name => 'ID',:data_index => 'id',:m_attr => m_field.m_attrs.find_by_name('id'),:xtype => 'VDefaultColumn',:sortable => true,:width => 35},
    #                      {:name => '属性名称',:data_index => 'name',:m_attr => m_field.m_attrs.find_by_name('name'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                      {:name => '属性',:data_index => 'attr',:m_attr => m_field.m_attrs.find_by_name('attr'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                      {:name => 'VField',:data_index => 'vfield',:m_attr => m_field.m_attrs.find_by_name('vfield'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                      {:name => '是否禁用',:data_index => 'disabled',:m_attr => m_field.m_attrs.find_by_name('disabled'),:xtype => 'VBooleanColumn',:sortable => true,:width => 75},
    #                      {:name => '所属标签',:data_index => 'm_tab_name',:association => 'm_tab',:association_name => 'name',:m_attr => m_field.m_attrs.find_by_name('m_tab_id'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75}
    #                     ])
    #mtf.m_fields.create([{:name => 'ID',:attr => 'id',:vfield => 'VNumber',:m_attr => m_field.m_attrs.find_by_name('id'),:disabled => true,:order_by => 1,:position => 1,:desc => '属性序号，无需填写',:help => ''},
    #                     {:name => '属性名称',:attr => 'name',:vfield => 'VString',:m_attr => m_field.m_attrs.find_by_name('name'),:disabled => false,:order_by => 2,:position => 1,:desc => '属性的名称，显示在列表上方',:help => ''},
    #                     {:name => '属性',:attr => 'attr',:vfield => 'VString',:m_attr => m_field.m_attrs.find_by_name('attr'),:disabled => false,:order_by => 3,:position => 1,:desc => '与属性名称对应的属性',:help => ''},
    #                     {:name => 'VField',:attr => 'vfield',:vfield => 'VFieldCombobox',:m_attr => m_field.m_attrs.find_by_name('vfield'),:disabled => false,:order_by => 4,:position => 1,:desc => '此属性的编辑状态',:help => ''},
    #                     {:name => '是否禁用',:attr => 'disabled',:vfield => 'VYesOrNo',:m_attr => m_field.m_attrs.find_by_name('disabled'),:disabled => false,:order_by => 5,:position => 1,:desc => '是否允许用户操作',:help => ''},
    #                     {:name => '排列顺序',:attr => 'order_by',:vfield => 'VNumber',:m_attr => m_field.m_attrs.find_by_name('order_by'),:disabled => false,:order_by => 6,:position => 1,:desc => '在表单与列表中显示的顺序',:help => ''},
    #                     {:name => '占用列数',:attr => 'position',:vfield => 'VNumber',:m_attr => m_field.m_attrs.find_by_name('position'),:disabled => false,:order_by => 7,:position => 1,:desc => '与表单显示列数有关，表单显示占用一行的大小为此属性比上表单显示列数，默认值为1',:help => ''},
    #                     {:name => '所属标签',:attr => 'm_tab_id',:vfield => 'VIncludedTabsCombo',:m_attr => m_field.m_attrs.find_by_name('m_tab_id'),:disabled => false,:order_by => 8,:position => 1,:desc => '所属的标签',:help => ''},
    #                     {:name => 'Attr',:attr => 'm_attr_id',:vfield => 'VLongCombo',:m_attr => m_field.m_attrs.find_by_name('m_attr_id'),:disabled => false,:order_by => 9,:position => 1,:desc => '所属的属性',:help => ''},
    #                     {:name => '描述',:attr => 'desc',:vfield => 'VString',:m_attr => m_field.m_attrs.find_by_name('desc'),:disabled => false,:order_by => 10,:position => 1,:desc => '描述',:help => ''}])
    #
    #mtc.m_columns.create([{:name => 'ID',:data_index => 'id',:m_attr => m_column.m_attrs.find_by_name('id'),:xtype => 'VDefaultColumn',:sortable => true,:width => 35},
    #                      {:name => '列名称',:data_index => 'name',:m_attr => m_column.m_attrs.find_by_name('name'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                      {:name => '数据索引',:data_index => 'data_index',:m_attr => m_column.m_attrs.find_by_name('data_index'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                      {:name => '类型',:data_index => 'xtype',:m_attr => m_column.m_attrs.find_by_name('xtype'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                      {:name => '宽',:data_index => 'width',:m_attr => m_column.m_attrs.find_by_name('width'),:xtype => 'VNumberColumn',:sortable => true,:width => 75},
    #                      {:name => '是否排序',:data_index => 'sortable',:m_attr => m_column.m_attrs.find_by_name('sortable'),:xtype => 'VBooleanColumn',:sortable => true,:width => 75},
    #                      {:name => 'Attr',:data_index => 'm_attr_name',:m_attr => m_column.m_attrs.find_by_name('m_attr_id'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75}
    #                     ])
    #mtc.m_fields.create([{:name => 'ID',:attr => 'id',:vfield => 'VNumber'},
    #                     {:name => '列名称',:attr => 'name',:vfield => 'VString'},
    #                     {:name => '数据索引',:attr => 'data_index',:vfield => 'VString'},
    #                     {:name => '类型',:attr => 'xtype',:vfield => 'VGridColumnXtypeCombo'},
    #                     {:name => '宽',:attr => 'width',:vfield => 'VNumber'},
    #                     {:name => '是否排序',:attr => 'sortable',:vfield => 'VYesOrNo'},
    #                     {:name => 'Attr',:attr => 'm_attr_id',:vfield => 'VLongCombo'},
    #                     {:name => '所属标签',:attr => 'm_tab_id',:vfield => 'VIncludedTabsCombo'},
    #                     {:name => '关联属性',:attr => 'association',:vfield => 'VStirng'},
    #                     {:name => '关联属性名称',:attr => 'association_name',:vfield => 'VString'}
    #                    ])
    #mta.m_columns.create([{:name => 'ID',:data_index => 'id',:m_attr => m_action.m_attrs.find_by_name('id'),:xtype => 'VDefaultColumn',:sortable => true,:width => 35},
    #                      {:name => '动作名称',:data_index => 'name',:m_attr => m_action.m_attrs.find_by_name('name'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                      {:name => '动作类型',:data_index => 'event_type',:m_attr => m_action.m_attrs.find_by_name('event_type'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75},
    #                      {:name => 'Action',:data_index => 'event_name',:m_attr => m_action.m_attrs.find_by_name('event_name'),:xtype => 'VDefaultColumn',:sortable => true,:width => 75}])
    #mta.m_fields.create([{:name => 'ID',:attr => 'id',:vfield => 'VNumber'},
    #                     {:name => '动作名称',:attr => 'name',:vfield => 'VString'},
    #                     {:name => '动作类型',:attr => 'event_type',:vfield => 'VString'},
    #                     {:name => 'Action',:attr => 'event_name',:vfield => 'VString'}])
    #
  end

end
