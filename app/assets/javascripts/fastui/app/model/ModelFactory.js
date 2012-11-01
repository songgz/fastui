Ext.define('FastUI.model.ModelFactory', {
    name:'modelFactory',

    constructor:function (meta) {

    },
    getModel:function (name) {
        return Ext.define(name, {
            extend:'Ext.data.Model',
            fields:this.getModelFields(),
            proxy:{
                type:'rest',
                url:'/fastui/m_windows',
                format:'json'
                //        reader:{
                //            type:'json',
                //            root:'m_windows',
                //            successProperty:'success'
                //        }
            }
        });
    },
    getModelFields:function () {

    },
    getModelColumns:function () {

    },
    getModelStore:function () {

    },
    getFormFields:function () {

    }
});