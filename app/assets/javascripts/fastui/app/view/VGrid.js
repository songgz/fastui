Ext.define('FastUI.view.VGrid', {
    extend:'Ext.grid.Panel',
    requires: ['FastUI.store.MListMgr'],
    tab:{},
    selType:'rowmodel',
    multiSelect:false,
    border:true,
    //plugins: [Ext.create('Ext.grid.plugin.CellEditing', {clicksToEdit: 1})],
    initComponent:function () {
        this.title = this.getValue('title');
        this.columns = this.getGColumns();
        this.store = this.getGStore();
        this.callParent();
    },
    listeners:{
        itemclick:function( view, record, item, index, e, eOpts ){
            this.tab.winCtx.setWinCtx(this.tab.winId,this.tab.rest.getKey(),record.get('id'));
            this.tab.winCtx.setWinCtx(this.tab.winId,this.tab.rest.getTitle(),record.get('title'));
            if (record.get('m_entity_id')){
                this.tab.winCtx.setWinCtx(this.tab.winId,'m_entity_id',record.get('m_entity_id'));
            }
            this.tab.getBtn('edit').enable();
            this.tab.getBtn('del').enable();
        }
    },
    selectedId:function(){
        var id = 0;
        var records = this.getSelectionModel().getSelection();
        if (!Ext.isEmpty(records)) {
            id = records[0].get('id');
        }
        return id;
    },
    getValue:function (key) {
        return this.tab.valueObject[key];
    },

    getGStore:function () {
        return new Ext.data.JsonStore({
            autoLoad:true,
            pageSize:50,
            proxy:{
                type:'ajax',
                url:this.tab.rest.indexPath(),
                reader:{
                    type:'json',
                    root:'',
                    id:"id"
                }
            },
            fields:this.getGFields(),
            listeners:{
//                beforeload:function (store, operation, eOpts) {
//                    store.getProxy().extraParams = this.getParams();
//                },
//                scope:this
            }
        });
    },
    getMEntity:function () {
        return this.tab.valueObject.m_entity;
    },
    getMColumns:function () {
        return this.tab.valueObject.m_columns;
    },
    getGFields:function () {
        var fields = [];
        Ext.each(this.getMColumns(), function (column) {
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
    getGColumns:function () {
        var columns = [Ext.create('Ext.grid.RowNumberer')];
        if (this.getMColumns() <= 0) return columns;
        Ext.each(this.getMColumns(), function (column) {
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