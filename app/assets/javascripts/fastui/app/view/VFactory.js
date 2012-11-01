Ext.define('FastUI.view.VFactory', {
    name:'vfactory',

    constructor:function (vdata) {
        this._vdata = vdata;
        this.model_class = this._vdata.model_class;
        if(this.model_class){
            this.resource = Inflector.pluralize(this._vdata.model_class.toLowerCase());
        }
//        this._vdata.model_class = 'm_window'
    },

    getVData:function () {
        return this._vdata;
    },
    getModel:function(){

    },
    getStore:function () {
        return new Ext.data.JsonStore({
            // store configs
            //storeId: 'myStore',
            autoLoad:true,
            proxy:{
                type:'ajax',
                url:'/fastui/'+this.resource+'.json', //model_class
                reader:{
                    type:'json',
                    root:''
//                    idProperty:'id'
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
        Ext.each(this._vdata.m_fields, function (field) {
            field.name = this.model_class +'['+field.m_attr + ']';
            fields.push(Ext.create('FastUI.view.vfield.VFieldFactory').buildField(field));
//            fields.push({
//                fieldLabel:field.title,
//                name:fieldName,
////                value:record.get('title'),
//                allowBlank:true
//            });
        },this);
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

