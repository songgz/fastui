Ext.define('FastUI.view.vfield.VNumber',{
    extend: 'Ext.form.field.Number',
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    initComponent:function(){
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('name') + ']';
        this.disabled = this.getFValue('readonly');
        this.allowBlank = true;
        this.callParent();
    },
    getFValue:function (key) {
        return this.valueObject[key];
    }
});