Ext.define('FastUI.view.VMenu', {
    extend:'Ext.tree.Panel',
    alias: 'widget.vMenu',
    title:'菜单',
    //width:150,



    animate:false,
    //cls:"navigation",
    collapseMode:"mini",
    collapsible:true,
    iconCls:"fastui-menu",
    //itemId:"example",
    lines:false,
    //region:"west",
    rootVisible:false,
    split:true,
    dockedItems:[{dock:"top",items:[{xtype:"tbfill"},
        {iconCls:"fastui-tree-expand",tooltip:"Expand All",xtype:"button", listeners:{click:{fn:function (sender ,e ,eOpts) {sender.up().up().expandAll();}}}},
        {iconCls:"fastui-tree-collapse",tooltip:"Collapse All",xtype:"button", listeners:{click:{fn:function (sender ,e ,eOpts) { sender.up().up().collapseAll(); sender.up().up().getRootNode().expand();}}}}],xtype:"toolbar"}],




    //scope: this,
    //store: 'MMenus',
    //rootVisible: false,

    initComponent: function(){
      this.store = Ext.create('Ext.data.TreeStore', {
          autoLoad:true,
          fields:['id', {name:'text', mapping:'title'},{name:'leaf',mapping:'leaf?'},{name:'expanded',mapping:'child?'}, 'm_window_id'],
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
      //Ext.data.StoreManager.lookup(this.store);
      this.callParent(arguments);
    }
});





