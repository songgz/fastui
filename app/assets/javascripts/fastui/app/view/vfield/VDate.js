Ext.define('FastUI.view.vfield.VDate',{
    extend: 'Ext.form.field.Date',
    format: 'Y-m-d',
    initComponent:function(){
        this.callParent();
    }
});