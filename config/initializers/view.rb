# encoding: utf-8
Fastui::View.instance.config do |conf|

  #attr = {entity_kind: 'sys', seq: 1, is_active: true}


  conf.win :m_menu, title:'菜单', window_kind: 'maintain' do |w|
    w.tab :m_menu, title:'菜单', m_entity:'Fastui::Menu', is_readonly:true, members:[
        {name:'id', title:'ID', datatype:'VNumber', is_display:true, is_readonly:true},
        {name:'title', title: '标题', is_display: true, is_readonly: false}
    ]
    w.tab :m_menu_item, title:'菜单项', members:[{name:'id',title:'ID',datatype:'int'}]
  end

end