Ext.define('FastUI.view.vfield.VBool',{
    extend: 'Ext.form.field.Checkbox',
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    inputValue: 'true',
    uncheckedValue: 'false',
    initComponent:function(){
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('name') + ']';
        this.disabled = this.getFValue('readonly');
        this.allowBlank = true;
        this.callParent();
    },
    getFValue:function (key) {
        return this.valueObject[key] || '';
    }
});