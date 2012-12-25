Ext.define('FastUI.view.VGrid', {
    extend: 'Ext.grid.Panel',
//    selModel:{
//        mode : 'SINGLE',
//        allowDeselect: false
//
//    },
////    selModel:new Ext.selection.RowModel({SINGLE: true}),
    valueObject: {},
    selType: 'rowmodel',

    multiSelect:false,
    //plugins: [Ext.create('Ext.grid.plugin.CellEditing', {clicksToEdit: 1})],
    initComponent:function(){
        this.title = this.getValue('title');
        this.columns = this.getGridColumns();
        this.store = this.getStore();
        this.callParent();
    },
    listeners:{
        selectionchange:function (selectModel, selected, eOpts){
//            var record = selected[0];
//            alert(Ext.encode(record.getData()));
        },scope:this
    },
    getValue:function(key){
        return this.valueObject[key];
    },
    getParams:function () {
        var p = {};
        if (!Ext.isEmpty(this.getValue('included_tab_id'))) {
            var tab = Ext.getCmp('tab-' + this.getValue('included_tab_id'));
            if (tab && tab.grid) {
                var records = tab.grid.getSelectionModel().getSelection();
                var id = 0;
                if (!Ext.isEmpty(records)) {
                    id = records[0].get('id');
                }
                p[tab.getEntity().name.demodulize().underscore() + '_id'] = id;
            }
        }
        return p;
    },
    getStore:function () {
        return new Ext.data.JsonStore({
            pageSize:50,
            proxy:{
                type:'ajax',
                url: this.getEntity().name.underscore().pluralize() + '.json',
                reader:{
                    type:'json',
                    root:'',
                    id:"id"
                }
            },
            fields:this.getGridFields(),
            listeners:{
                beforeload:function (store, operation, eOpts) {
                    store.getProxy().extraParams = this.getParams();
                }, scope:this
            }
        });
    },
    getEntity:function(){
        return this.valueObject.m_entity;
    },
    getColumns:function(){
        return this.valueObject.m_columns;
    },
    getGridFields:function () {
        var fields = [];
        Ext.each(this.getColumns(), function (column) {
            var col = {name:column.m_property.name};
            fields.push(col);
            if (column.m_property.name.indexOf('_id') > 0) {
                var  entity_title = {name:column.m_property.name.replace('_id', '')};
                entity_title.convert = function (v, rec) {
                    if (v == 0) {
                        return 0;
                    } else {
                        return rec.raw[column.m_property.name.replace('_id', '')].title;
                    }
                };
                fields.push(entity_title);
            }
        }, this);
        return fields;
    },
    getGridColumns:function () {
        var columns = [];
        Ext.each(this.getColumns(), function (column) {
            if (column.m_property.name.indexOf('_id') > 0) {
                var entity_title = {text:column.title, dataIndex:column.m_property.name.replace('_id', ''), width:column.width };
                columns.push(entity_title);
            }
            var col = {text:column.title, dataIndex:column.m_property.name, width:column.width };
            if(col.dataIndex.indexOf('_id') > 0){
                col.hidden = true;
            }
            switch (column.m_property.m_datatype.class_name) {
//                case 'Fastui::MList':
//                    var list_store = FastUI.store.MListMgr.getStore(column.m_property.m_datatype_id);
//                    col.renderer = function (val) {
//                        var index = list_store.findExact('name', val);
//                        if (index != -1) {
//                            var rs = list_store.getAt(index).data;
//                            return rs.title;
//                        }
//                    };
//                    columns.push(col);
//                    break;
//                case 'Fastui::MYesOrNo':
//                    col.renderer = function (val) {
//                        if (val) {
//                            return '是'
//                        } else {
//                            return '否'
//                        }
//                    };
//                    columns.push(col);
//                    break;
                default:
                    columns.push(col);
                    break;
            }
        }, this);
        return columns;
    }
});