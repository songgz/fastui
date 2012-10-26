
Ext.define('FastUI.view.VGrid', {
    extend: 'Ext.grid.Panel',
    initComponent:function(){
        this.columns = this.vfactory.getColumns();
        this.store = this.vfactory.getStore();
        this.callParent();
    }
});