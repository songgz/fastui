# encoding: utf-8
#desc "Explaining what the task does"
namespace :fastui do
  namespace :init do
    desc "init fastui system data"
    task :load_window=> :environment do


      w = Fastui::MWindow.create(:title => 'FastUI')

      t1 = w.m_tabs.create(:title => '窗口')
      t1.m_fields.create(:title => '标题')

      t2 = w.m_tabs.create(:title => '标签')
      t2.m_fields.create(:title => '标题')

      t3 = w.m_tabs.create(:title => '字段')
      t3.m_fields.create(:title => '标题')

      t4 = w.m_tabs.create(:title => '表格列属性')
      t4.m_fields.create(:title => '标题')

      t4 = w.m_tabs.create(:title => '标签Action')
      t4.m_fields.create(:title => '标题')

      t1.m_columns.create([{:title => 'ID',:data_index => 'id',:xtype => 'VDefaultColumn',:sortable => true,:width => 35},
                            {:title => '窗口名称',:data_index => 'title',:xtype => 'VDefaultColumn',:sortable => true,:width => 75}])

    end
  end
end
