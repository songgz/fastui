# FastUI

FastUI is a Ajax Ruby framework for Rapid Development enterprise-level Web application style interfaces.
In Fastui you only have to write the domain classes in plain Ruby to get a web application ready for production.

This project rocks and uses MIT-LICENSE.

## Configuration

For example, the syntax for view like this:
By default your view is configured in the file config/initializers/fastui_config.rb.
```ruby
  Fastui::View.instance.config do |conf|
    conf.win :m_list, title: '数据字典', window_kind: 'maintain' do |w|
      w.tab :m_list, title: '枚举', entity:'Fastui::MList', members:[
        {name:'id', title: 'ID', datatype:'VInteger', readonly: true},
        {name:'title', title: '标题', datatype:'VString'},
        {name:'print_text', title: '打印文本', datatype:'VText'},
        {name:'name', title: '标识', datatype:'VString'},
        {name: 'entity_kind', title: '实体种类', datatype: 'VRadio'},
        {name: 'seq', title: '排序', datatype: 'VInteger'},
        {name: 'is_active', title: '是否激活', datatype: 'VBool'},
        {name: 'note', title: '备注', datatype: 'VText'},
        {name: 'help', title: '帮助', datatype: 'VHtml', display: 'form'}
      ]
      w.tab :m_list_item, title:'枚举项', entity:'Fastui::MListItem', included_tab: 'm_list', members:[
        {name:'id', title: 'ID', datatype:'VInteger', readonly: true},
        {name:'title', title: '标题', datatype:'VString'},
        {name:'print_text', title: '打印文本', datatype:'VString'},
        {name:'name', title: '标识', datatype:'VText'}
      ]
    end
  end
```

Generates a view that looks like this:

![Image Alt](https://github.com/songgz/fastui/raw/master/doc/fastui_grid.jpg)

![Image Alt](https://github.com/songgz/fastui/raw/master/doc/fastui_form.jpg)

## Getting Started

Fastui is released as a Ruby Gem. The gem is to be installed within a Ruby
on Rails 3 application. To install, simply add the following to your Gemfile:

    gem 'fastui'

After updating your bundle, run the installer
```shell
  $> rails generate fastui:install -s
  $> rake db:migrate
  $> rails generate fastui:init
  $> rails server
```
Visit http://localhost:3000/fastui and log in using:

Voila! You're on your brand new FastUI main window.

new project is moved to https://github.com/songgz/fast_ext
