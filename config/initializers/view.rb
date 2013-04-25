# encoding: utf-8
Fastui::View.instance.config do |conf|
  default = [
             {name:'entity_kind', title: '实体种类', datatype:'VSingleChoice'},
             {name:'seq', title: '排序', datatype:'VNumber'},
             {name:'is_active', title: '是否激活', datatype:'VYesOrNo'},
             {name:'note', title: '备注', datatype:'VTextArea'},
             {name:'help', title: '帮助', datatype:'VTextArea', display:'form'},
             {name:'createdbyorg_id',title: '创建组织', datatype:'VLookup', ref:{entity:'Fastui::MOrg'}, display:'grid'},
             {name:'createdby_id', title: '创建人', datatype:'VLookup', ref:{entity:'Fastui::MPerson'}, display:'grid'},
             {name:'updatedby_id', title: '更新人', datatype:'VLookup', ref:{entity:'Fastui::MPerson'}, display:'grid'}
  ]

  conf.win :m_menu, title:'菜单', window_kind: 'maintain' do |w|
    w.tab :m_menu, title:'菜单', entity:'Fastui::MMenu', readonly:true, members:[
        {name:'id', title:'ID', datatype:'VNumber', readonly:true},
        {name:'title', title: '标题', datatype:'VText'},
        {name:'print_text', title: '打印文本', datatype:'VText'},
        {name:'name', title: '标识', datatype:'VText'}
    ] + default
    w.tab :m_menu_item, title:'菜单项', entity:'Fastui::MMenuItem', included_tab_id: 'm_menu', members:[
        {name:'id', title: 'ID', datatype:'VNumber', readonly: true},
        {name:'title', title: '标题', datatype:'VText'},
        {name:'print_text', title: '打印文本', datatype:'VText'},
        {name:'name', title: '标识', datatype:'VText'},
        {name:'m_menu_id', title: '对应菜单', datatype:'VLookup', ref:{entity:'Fastui::MMenu'}, default_logic: "{id:${m_menu_id},title:'${m_menu_title}'}"},
        {name:'window', title: '对应窗口', datatype:'VText'}
    ] + default
  end

  conf.win :m_org, title: '组织', window_kind: 'maintain' do |w|
    w.tab :m_org, title: '组织', entity:'Fastui::MOrg', grid_kind:'treegrid', members:[
        {name:'id', title: 'ID', datatype:'VNumber', readonly: true},
        {name:'title', title: '名称', datatype:'VTree'},
        {name:'print_text', title: '打印文本', datatype:'VText'},
        {name:'name', title: '标识', datatype:'VText'},
        {name:'parent_id', title: '上级组织', datatype:'VLookup', ref:{entity:'Fastui::MOrg'}}
    ] + default
  end

  conf.win :m_person, title: '人员', window_kind: 'maintain' do |w|
    w.tab :m_person, title: '人员', entity:'Fastui::MPerson', members:[
        {name:'id', title: 'ID', datatype:'VNumber', readonly: true},
        {name:'title', title: '标题', datatype:'VText'},
        {name:'print_text', title: '打印文本', datatype:'VText'},
        {name:'name', title: '标识', datatype:'VText'},
        {name:'access_level', title: '访问级别', datatype:'VSingleChoice'}
    ] + default
    w.tab :m_role, title: '角色', entity:'Fastui::MRole', members:[
        {name:'id', title: 'ID', datatype:'VNumber', readonly: true},
        {name:'title', title: '标题', datatype:'VText'},
        {name:'print_text', title: '打印文本', datatype:'VText'},
        {name:'name', title: '标识', datatype:'VText'}
    ] + default
  end

  conf.win :m_list, title: '数据字典', window_kind: 'maintain' do |w|
    w.tab :m_list, title: '枚举', entity:'Fastui::MList', members:[
        {name:'id', title: 'ID', datatype:'VNumber', readonly: true},
        {name:'title', title: '标题', datatype:'VText'},
        {name:'print_text', title: '打印文本', datatype:'VText'},
        {name:'name', title: '标识', datatype:'VText'}
    ] + default
    w.tab :m_list_item, title:'枚举项', entity:'Fastui::MListItem', included_tab_id: 'm_list', members:[
        {name:'id', title: 'ID', datatype:'VNumber', readonly: true},
        {name:'title', title: '标题', datatype:'VText'},
        {name:'print_text', title: '打印文本', datatype:'VText'},
        {name:'name', title: '标识', datatype:'VText'}
    ] + default
  end

end