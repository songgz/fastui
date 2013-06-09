# encoding: utf-8
namespace :fastui do
  desc "loading fastui 'system' data"
  task :init => :environment do
    system = Fastui::MOrg.create({name: 'system', title: '系统组织', entity_kind:'sys', seq:1, is_active:true})
    administrator = Fastui::MPerson.create({name:'administrator', title:'系统管理员', username:'admin', password:'admin', access_level:'org', entity_kind:'sys', seq:1, is_active:true, createdbyorg:system,})
    attr = {entity_kind:'sys', seq:1, is_active:true, createdbyorg:system, createdby:administrator, updatedby:administrator}

    Fastui::MList.create({name: 'access_level', title: '访问级别'}.merge(attr)) do |al|
      al.m_list_items.build([{name: 'system', title: '系统级别'}, {name: 'org', title: '组织级别'}, {name: 'dept', title: '部门级别'}].map {|a| a.merge(attr)})
    end
    Fastui::MList.create({name: 'entity_kind', title: '实体种类'}.merge(attr)) do |ek|
      ek.m_list_items.build([{name: 'sys', title: '系统实体'}, {name: 'app', title: '应用实体'}].map {|a| a.merge(attr)})
    end
    Fastui::MList.create({name: 'window_kind', title: '窗体种类'}.merge(attr)) do |wk|
      wk.m_list_items.build([{name: 'maintain', title: '维护'}, {name: 'transaction', title: '事务'}, {name: 'query', title: '查询'}].map {|a| a.merge(attr)})
    end

    Fastui::MMenu.create({name: 'sys_menu', title: '系统菜单'}.merge(attr)) do |sm|
      sm.m_menu_items.build({name: 'app_option', title: '应用设置', m_menu: sm}.merge(attr)) do |so|
        so.children.build({name: 'app_menu', title: '菜单', window:'m_menu', m_menu: sm}.merge(attr))
        so.children.build({name: 'app_org', title: '组织', window:'m_org', m_menu: sm}.merge(attr))
        so.children.build({name: 'app_person', title: '人员', window:'m_person', m_menu: sm}.merge(attr))
        so.children.build({name: 'app_role', title: '角色', window:'m_role', m_menu: sm}.merge(attr))
        so.children.build({name: 'app_data', title: '数据字典', window: 'm_list', m_menu: sm}.merge(attr))
        so.children.build({name: 'app_help', title: '帮助', window:'m_help', m_menu: sm}.merge(attr))
      end
    end
  end
end