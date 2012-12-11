Ext.define('FastUI.view.VFactory', {
    name:'vfactory',

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
    getColumns:function() {
        var columns = [];
        Ext.each(this._vdata.m_columns, function (column) {
            if (column.m_property.name == 'window_kind' || column.m_property.name == 'entity_kind') {
                var col_combobox = Ext.create('FastUI.view.vfield.VComboBox', {glossary_id:column.m_property.refable_id})
                columns.push({
                    text:column.title,
                    dataIndex:column.m_property.name,
                    width:column.width,
                    editor:col_combobox,
                    renderer:function (val) {
                     var  index = col_combobox.getStore().findExact('name',val);
                       if (index != -1){
                         var  rs = col_combobox.getStore().getAt(index).data;
                           return rs.title;
                       }
                    }
                });
            } else {
                columns.push({
                    text:column.title,
                    dataIndex:column.m_property.name,
                    width:column.width
                });
            }
        });

        return columns;
    },
    getFields:function () {
        var fields = [];
        Ext.each(this._vdata.m_columns, function (column) {
            var col = {name:column.m_property.name};
            if (column.m_property.name.indexOf('_id') > 0) {
//                col.convert = this.fieldWithIdMapFn;
                col.convert = function (v, rec) {
                    if (v == 0) {
                        return 0;
                    } else {
//                        alert(rec.raw[column.m_property.name.replace('_id','')].title);
                        return rec.raw[column.m_property.name.replace('_id', '')].title;
                    }
                }
            }
            fields.push(col);
        }, this);
        return fields;
    },

    getFormFields:function () {
        var fields = [];
        Ext.each(this._vdata.m_fields, function (field) {
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

