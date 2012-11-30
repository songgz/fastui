Ext.define('FastUI.view.VGrid', {
    extend: 'Ext.grid.Panel',
//    selModel:{
//        mode : 'SINGLE',
//        allowDeselect: false
//
//    },
////    selModel:new Ext.selection.RowModel({SINGLE: true}),
//    selType: 'rowmodel',
    multiSelect:false,
    initComponent:function(){
        this.title = this.vfactory.getVData().title;
        this.columns = this.vfactory.getColumns();
        this.store = this.vfactory.getStore();
        this.store.load({
            params :this.vfactory.getParams()
        });
//        this.store.getProxy().extraParams = this.vfactory.getParams();
        this.callParent();
    }
});