Ext.define('FastUI.view.VGrid', {
    extend:'Ext.grid.Panel',
    valueObject:{},
    selType:'rowmodel',
    multiSelect:false,
    //plugins: [Ext.create('Ext.grid.plugin.CellEditing', {clicksToEdit: 1})],
    initComponent:function () {
        this.title = this.getValue('title');
        this.columns = this.getGridColumns();
        this.store = this.getStore();
        this.callParent();
    },
//    listeners:{
//        selectionchange:function (selectModel, selected, eOpts){
////            var record = selected[0];
////            alert(Ext.encode(record.getData()));
//        },scope:this
//    },
    getValue:function (key) {
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
//            autoLoad:true,
//            autoSync: true,
            pageSize:50,
            proxy:{
                type:'ajax',
                url:this.getEntity().name.underscore().pluralize() + '.json',
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
//                    return false;
                }, scope:this
            }
        });
    },
    getEntity:function () {
        return this.valueObject.m_entity;
    },
    getColumns:function () {
        return this.valueObject.m_columns;
    },
    getGridFields:function () {
        var fields = [];
        Ext.each(this.getColumns(), function (column) {
            var field = {
                name:column.m_property.name,
                type:'string'
            };
            var prop = column.m_property;
            switch (prop.m_datatype.class_name) {
                case 'Fastui::MRelation':
                    var entity = {
                        name:column.m_property.name.replace('_id', ''),
                        type:'auto'
                    };
                    fields.push(entity);
            }
            fields.push(field);

        }, this);
        return fields;
    },
    getGridColumns:function () {
        var columns = [Ext.create('Ext.grid.RowNumberer')];
        Ext.each(this.getColumns(), function (column) {
            var col = {
                text:column.title,
                dataIndex:column.m_property.name,
                width:column.width
                //xtype:''
            };
            var prop = column.m_property;
            switch (prop.m_datatype.class_name) {
                case 'Fastui::MRelation':
                    col.xtype = 'templatecolumn';
                    col.tpl = '{' + prop.name.replace('_id', '') + '.title}';
                    break;
                case 'Fastui::MList':
                    var list_store = FastUI.store.MListMgr.getStore(prop.m_datatype_id);
                    col.renderer = function (val) {
                        var index = list_store.findExact('name', val);
                        if (index > -1) {
                            var rs = list_store.getAt(index).data;
                            return rs.title;
                        }
                        return "";
                    };
                    break;
                case 'Fastui::MYesOrNo':
                    col.renderer = function (val) {
                        return val ? '是' : '否';
                    };
                    break;
                default:
                    break;
            }
            columns.push(col);
        }, this);

        return columns;
    }
});