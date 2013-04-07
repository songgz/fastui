Ext.define('FastUI.view.VMenu', {
    extend:'Ext.tree.Panel',
    alias: 'widget.vMenu',
    region:'west',
    collapsible:true,
    title:'菜单',
    width:150,

    //scope: this,
    //store: 'MMenus',
    rootVisible: false,

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





