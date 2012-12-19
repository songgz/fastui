Ext.define('FastUI.view.VFactory', {
    name:'vfactory',
    requires:['FastUI.store.MListMgr'],
    constructor:function (vdata) {
        this._vdata = vdata;
        if (this._vdata.m_entity) {
            this.model_class = this._vdata.m_entity.name.demodulize().underscore();
            this.resource = this._vdata.m_entity.name.underscore().pluralize();
        }
    },
    getVData:function () {
        return this._vdata;
    },
    getModelClass:function () {
        return this.model_class;
    },
    getModel:function () {

    },
    getUrl:function () {
        var url = this.resource + '.json';
        return  url;
    },
    getParams:function () {
        var p = {};
        if (!Ext.isEmpty(this.getVData().included_tab_id)) {
            var tab = Ext.getCmp('tab_' + this.getVData().included_tab_id);
            if (tab && tab.grid) {
                var records = tab.grid.getSelectionModel().getSelection();
                var id = 0;
                if (!Ext.isEmpty(records)) {
                    id = records[0].get('id');
                }
                p[tab.vfactory.getModelClass() + '_id'] = id;
            }
        }
        return p;
    },
    getStore:function () {
        return new Ext.data.JsonStore({
            pageSize:50,
            proxy:{
                type:'ajax',
                url:this.getUrl(),
                reader:{
                    type:'json',
                    root:'',
                    id:"id"
                }
            },
            fields:this.getFields(),
            listeners:{
                beforeload:function (store, operation, eOpts) {
                    store.getProxy().extraParams = this.getParams();
                }, scope:this
            }
        });
    },
    get_list_store:function (list_id) {
        Ext.apply(Ext.data.Connection.prototype, {
            async:false
        });
        var list_store = FastUI.store.MListMgr.getStore(list_id).load();
        Ext.apply(Ext.data.Connection.prototype, {
            async:true
        });
        return list_store;
    },
    getColumns:function () {
        var columns = [];
        Ext.each(this._vdata.m_columns, function (column) {
            if (column.m_property.name.indexOf('_id') > 0) {
                var entity_title = {text:column.title, dataIndex:column.m_property.name.replace('_id', ''), width:column.width };
                columns.push(entity_title);
            }
            var col = {text:column.title, dataIndex:column.m_property.name, width:column.width };
            if(col.dataIndex.indexOf('_id') > 0){
                col.hidden = true;
            }
            switch (column.m_property.m_datatype.class_name) {
                case 'Fastui::MList':
                    var list_store = this.get_list_store(column.m_property.m_datatype_id);
                    col.renderer = function (val) {
                        var index = list_store.findExact('name', val);
                        if (index != -1) {
                            var rs = list_store.getAt(index).data;
                            return rs.title;
                        }
                    };
                    columns.push(col);
                    break;
                case 'Fastui::MYesOrNo':
                    col.renderer = function (val) {
                        if (val) {
                            return '是'
                        } else {
                            return '否'
                        }
                    };
                    columns.push(col);
                    break;
                default:
                    columns.push(col);
                    break;
            }
        }, this);
        return columns;
    },
    getFields:function () {
        var fields = [];
        Ext.each(this._vdata.m_columns, function (column) {
            var col = {name:column.m_property.name};
            fields.push(col);
            if (column.m_property.name.indexOf('_id') > 0) {
              var  entity_title = {name:column.m_property.name.replace('_id', '')};
                entity_title.convert = function (v, rec) {
                    if (v == 0) {
                        return 0;
                    } else {
//                        alert(rec.raw[column.m_property.name.replace('_id','')].title);
                        return rec.raw[column.m_property.name.replace('_id', '')].title;
                    }
                };
                fields.push(entity_title);
            }
//            fields.push(col);
        }, this);
        return fields;
    },

    getFormFields:function () {
        var m_entity_id = 0;
        if (!Ext.isEmpty(this.getVData().included_tab_id)) {
            var tab = Ext.getCmp('tab_' + this.getVData().included_tab_id);
            if (tab && tab.grid) {
                var records = tab.grid.getSelectionModel().getSelection();
//                alert(Ext.encode(records[0].getData()));
                m_entity_id = records[0].get('m_entity_id');
//                alert(records[0].get('m_entity_id'));
            }
        }
        var fields = [];
//        alert(this._vdata.m_entity_id);
        Ext.each(this._vdata.m_fields, function (field) {
            field.m_window_id = this._vdata.m_window_id;
            field.m_entity_id = m_entity_id;
            field.name = this.getModelClass() + '[' + field.m_property.name + ']';
            fields.push(Ext.create('FastUI.view.vfield.VFieldFactory').buildField(field));
        }, this);
        return fields;
    },

    getToolBar:function () {
        return Ext.create('Ext.toolbar.Toolbar', {
            items:[
                {   text:'新建',
                    handler:function () {
                        this.loadForm();
                    },
                    scope:this
                },
                { text:'编辑',
                    handler:function () {
                        alert('编辑');
                    }},
                { text:'列表',
                    handler:function () {
                        this.loadGrid();
                    }, scope:this},
                { text:'保存',
                    handler:function () {
                        alert('保存');
                    }},
                { text:'删除',
                    handler:function () {
                        alert('删除');
                    }},
                { text:'帮助',
                    handler:function () {
                        alert('帮助');
                    }}
            ]
        });
    }
});

