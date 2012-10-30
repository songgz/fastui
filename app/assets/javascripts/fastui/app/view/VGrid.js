
Ext.define('FastUI.view.VGrid', {
    extend: 'Ext.grid.Panel',
    selType: 'rowmodel',
    multiSelect:false,
    initComponent:function(){
        this.columns = this.vfactory.getColumns();
        this.store = this.vfactory.getStore();
        this.callParent();
    }
});