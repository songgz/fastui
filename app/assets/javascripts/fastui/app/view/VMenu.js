Ext.define('FastUI.view.VMenu', {
    extend:'Ext.tree.Panel',
    requires:['FastUI.store.MWindowMgr'],
    alias: 'widget.vMenu',
    title:'菜单',
    animate:false,
    collapseMode:"mini",
    collapsible:true,
    iconCls:"fastui-menu",
    lines:false,
    rootVisible:false,
    split:true,
    dockedItems:[{dock:"top",items:[{xtype:"tbfill"},
        {iconCls:"fastui-tree-expand",tooltip:"Expand All",xtype:"button", listeners:{click:{fn:function (sender ,e ,eOpts) {sender.up().up().expandAll();}}}},
        {iconCls:"fastui-tree-collapse",tooltip:"Collapse All",xtype:"button", listeners:{click:{fn:function (sender ,e ,eOpts) { sender.up().up().collapseAll(); sender.up().up().getRootNode().expand();}}}}],xtype:"toolbar"}
    ],

    initComponent: function(){
      this.store = Ext.create('Ext.data.TreeStore', {
          autoLoad:true,
          fields:['id', {name:'text', mapping:'title'},'leaf','expanded', 'window'],
          proxy:{
              type:'ajax',
              url:'/fastui/m_menu_items.json',
              reader:{
                  type:'json',
                  root:'',
                  record:''
                  //successProperty:''
              }
          },
          root:{
              name:'菜单',
              expanded:true
          }
      });
      this.callParent(arguments);
    },

    listeners:{
        itemclick:function(self, record, item, index, e, eOpts){
            this.loadVWindow(self, record, item, index, e, eOpts);
        }
    },

    loadVWindow:function (self, record, item, index, e, eOpts) {
        var c = Ext.getCmp('mycenter');
        c.setLoading(true);
        var id = record.get('window');
        //var id = 'm_list';


        if (record.get('leaf')) {
            FastUI.store.MWindowMgr.load(id, function (obj) {
                var winId = 'win-' + id;
                var win = Ext.getCmp(winId);
                if (!win) {
                    win = Ext.create('FastUI.view.VWindow', {
                        id: winId,
                        valueObject: obj
                    });
                    c.add(win);
                }
                c.setActiveTab(win);
                c.setLoading(false);
            });
        }

    }
});





