Ext.define('FastUI.view.VFactory', {
    name:'vfactory',

    constructor:function (vdata) {
        this._vdata = vdata;
        this._vdata.model_class = 'm_window'
    },

    getVData:function () {
        return this._vdata;
    },

    getStore:function () {
        return new Ext.data.JsonStore({
            // store configs
            //storeId: 'myStore',
            autoLoad:true,
            proxy:{
                type:'ajax',
                url:'/fastui/m_windows.json', //model_class
                reader:{
                    type:'json',
                    root:'',
                    idProperty:'id'
                }
            },

            //alternatively, a Ext.data.Model name can be given (see Ext.data.Store for an example)
            //fields: ['name', 'url', {name:'size', type: 'float'}, {name:'lastmod', type:'date'}]
            fields:this.getFields()     //tab.m_fields
        });
    },

    getColumns:function () {
        var columns = [];
        Ext.each(this._vdata.m_columns, function (column) {
            columns.push({
                header:column.title,
                dataIndex:column.data_index
            });
        });
        return columns;
    },

    getFields:function () {
        var fields = [];
        Ext.each(this._vdata.m_columns, function (column) {
            fields.push({
                name:column.data_index
            });
        });
        return fields;
    },

    getFormFields:function () {
        var fields = [];
        var fieldName = this._vdata.model_class + '[title]';
        Ext.each(this._vdata.m_fields, function (field) {
//            alert(field.m_attr);
            fields.push({
                fieldLabel:field.title,
                name:fieldName,
                allowBlank:true
            });
        });
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

