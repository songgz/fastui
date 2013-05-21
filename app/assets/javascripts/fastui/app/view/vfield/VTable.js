Ext.define('FastUI.view.vfield.VTable', {
    extend:'Ext.form.field.ComboBox',
    requires:['FastUI.store.MListMgr'],
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    valueField:'id',
    displayField:"title",
    forceSelection:true,
    triggerAction:'all',
    editable:false,
    selectOnFocus:true,

    initComponent:function () {
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('name') + ']';
        this.disabled = this.getFValue('readonly');
        this.allowBlank = true;
        this.store = this.getStore();
        this.callParent();
    },

    getFValue:function (key) {
        return this.valueObject[key];
    },

    getMEntity:function(){
        return this.valueObject.ref.entity;
    },

    getStore:function () {
        var rest = Ext.create('FastUI.view.Rest', this.getMEntity());
        return new Ext.data.JsonStore({
            autoLoad: true,
            fields:['id', 'title'],
            proxy:{
                type:'ajax',
                url:rest.indexPath(),
                reader:{
                    type:'json',
                    root:'rows',
                    totalProperty:"totalCount"
                }
            }
        });
    }

});