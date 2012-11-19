Ext.define('FastUI.view.VFactory', {
    name:'vfactory',

    constructor:function (vdata) {
        this._vdata = vdata;
        if(this._vdata.m_entity){
            this.model_class = this._vdata.m_entity.name;
            this.resource ='m_'+  Ext.util.Inflector.pluralize(this.model_class.toLowerCase().replace('m_',''));
        }
    },

    getVData:function () {
        return this._vdata;
    },
    getModelClass:function(){
        return this.model_class;
    },
    getModel:function(){

    },
    getUrl:function(){
        return '/fastui/'+this.resource+'.json'; //model_class
    },
    getStore:function () {
        return new Ext.data.JsonStore({
//            autoLoad:true,
            proxy:{
                type:'ajax',
                url:this.getUrl(),
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
                text:column.title,
                dataIndex:column.m_property.name,
                width:column.width
            });
        });

        return columns;
    },
//    fieldWithIdMapFn:function(v,rec){
//        if(v == 0){
//            return 0;
//        }else{
//            alert(Ext.JSON.encode(rec));
//            alert(v.name);
//            return rec.raw[column.m_property.name.replace('_id','')].title;
//        }
//    },
    getFields:function () {
        var fields = [];
        Ext.each(this._vdata.m_columns, function (column) {
            var col = {name:column.m_property.name};
            if (column.m_property.name.indexOf('_id') > 0){
//                col.convert = this.fieldWithIdMapFn;
                col.convert = function(v,rec){
                    if(v == 0){
                        return 0;
                    }else{
//                        alert(rec.raw[column.m_property.name.replace('_id','')].title);
                        return rec.raw[column.m_property.name.replace('_id','')].title;
                    }
                }
            }
            fields.push(col);
        },this);
        return fields;
    },

    getFormFields:function () {
        var fields = [];
        Ext.each(this._vdata.m_fields, function (field) {
            field.name = this.model_class +'['+field.m_property.name + ']';

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

