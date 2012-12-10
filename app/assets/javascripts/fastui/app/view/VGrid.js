Ext.define('FastUI.view.VGrid', {
    extend: 'Ext.grid.Panel',
//    selModel:{
//        mode : 'SINGLE',
//        allowDeselect: false
//
//    },
////    selModel:new Ext.selection.RowModel({SINGLE: true}),
    selType: 'rowmodel',
    plugins: [
        Ext.create('Ext.grid.plugin.CellEditing', {
            editing:true
//            clicksToEdit: 1
        })
    ],
    multiSelect:false,
    initComponent:function(){
        this.title = this.vfactory.getVData().title;
        this.columns = this.vfactory.getColumns();
        this.store = this.vfactory.getStore();
        this.callParent();
    }
});