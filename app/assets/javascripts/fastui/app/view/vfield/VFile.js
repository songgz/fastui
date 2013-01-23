Ext.define('FastUI.view.vfield.VFile',{
    extend: 'Ext.form.field.File',

    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},
    buttonText: '',
    buttonConfig: {
        iconCls: 'fastui-upload'
    },
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