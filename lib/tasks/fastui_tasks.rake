# encoding: utf-8
#desc "Explaining what the task does"
namespace :fastui do
  desc "init fastui system data"
  task :system_data => :environment do
    bl = Fastui::MGlossary.create({:name => 'boolean_value', :title => '布尔值'
                                  }).m_glossary_items.create([
                                                                 {:name => 'false', :title => '否'},
                                                                 {:name => 'true', :title => '是'}
                                                             ])

    al = Fastui::MGlossary.create({:name => 'access_level', :title => '访问级别'
                                  }).m_glossary_items.create([
                                                                 {:name => 'system', :title => '系统级别'},
                                                                 {:name => 'org', :title => '组织级别'},
                                                                 {:name => 'dept', :title => '部门级别'}
                                                             ])

    sys = Fastui::MGlossary.create({:name => 'entity_kind', :title => '实体种类'
                                   }).m_glossary_items.create([
                                                                  {:name => 'sys', :title => '系统实体'},
                                                                  {:name => 'app', :title => '应用实体'}
                                                              ])


    Fastui::MDataType.create([
                                             {:name => 'integer', :title => '整型'},
                                             {:name => 'string', :title => '字符串'},
                                             {:name => 'text', :title => '文本'}
                                         ])

    Fastui::MEntity.create({:name => 'm_window', :title => '窗口',:entity_kind => 'sys'
                           }).m_properties.create([
        {:name => 'title', :title => '标题'},
        {:name => 'note', :title => '备注'},
        {:name => 'entity_kind', :title => '实体种类',:m_ref_type => sys}
                                                                                      ])
    Fastui::MEntity.create({:name => 'm_tab',:title => '标签页',:entity_kind => 'sys'
                           }).m_properties.create([
        {:name=> 'title', :title => '标题'},
        {:name => 'note',:title => '备注'},
        {:name => 'readonly',:title => '只读情况',:m_ref_type => b1},
        {:name => 'entity_kind' ,:title => '实体种类',:m_ref_type => sys}
                                                  ])



    #w = Fastui::MWindow.create(:title => 'FastUI')
    #
    #t1 = w.m_tabs.create(:title => '窗口', :model_class => 'm_window')
    ##t1.m_fields.create(:title => '标题')
    #
    #t2 = w.m_tabs.create(:title => '标签', :model_class => 'm_tab')
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
    #
    #t1.m_columns.create([{:title => 'ID', :data_index => 'id', :xtype => 'VDefaultColumn', :sortable => true, :width => 35},
    #                     {:title => '窗口名称', :data_index => 'title', :xtype => 'VDefaultColumn', :sortable => true, :width => 75}])
    #
    #t1.m_fields.create([{:title => 'ID', :m_attr => 'id', :vfield => 'VNumber'},
    #                    {:title => '窗口名称', :m_attr => 'title', :vfield => 'VText'}])
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
