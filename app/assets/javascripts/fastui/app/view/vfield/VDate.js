Ext.define('FastUI.view.vfield.VDate',{
    extend: 'Ext.form.field.Date',
    format: 'Y-m-d',
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    initComponent:function(){
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('m_property').name + ']';
        this.disabled = this.getFValue('is_readonly');
        this.allowBlank = true;
        this.callParent();
    },
    getFValue:function (key) {
        return this.valueObject[key];
    }
});