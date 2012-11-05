Ext.define('FastUI.view.vfield.VComboBox',{
    extend: 'Ext.form.field.ComboBox',
    valueField: "id",
    displayField: "name",
//    forceSelection: true,
//    triggerAction: 'all',
    minChars: 2,
    selectOnFocus: true,
    initComponent:function(){

        this.callParent();
    }
});