
Ext.define('FastUI.view.VGrid', {
    extend: 'Ext.grid.Panel',
    selType: 'rowmodel',
    multiSelect:false,
    initComponent:function(){
        this.title = this.vfactory.getVData().title;
        this.columns = this.vfactory.getColumns();
        this.store = this.vfactory.getStore();
        this.callParent();
    }
});