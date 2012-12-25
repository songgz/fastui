Ext.define('FastUI.view.VMenu', {
    extend:'Ext.tree.Panel',
    alias: 'widget.vMenu',
    region:'west',
    collapsible:true,
    title:'菜单',
    width:150,

    //scope: this,
    store: 'MMenus',
    rootVisible: false,

    initComponent: function(){
      this.store = Ext.data.StoreManager.lookup(this.store);
      this.callParent(arguments);
    }
});





