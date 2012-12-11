Ext.define('FastUI.view.vfield.VYesOrNo',{
    extend: 'Ext.form.field.ComboBox',
    valueField:"bool",
    displayField:"name",
    forceSelection: true,
    triggerAction: 'all',
    selectOnFocus:true,
    queryMode:"local",
    hiddenName:this.name,
    initComponent:function(){
        this.store = Ext.create('Ext.data.ArrayStore',{
            fields: ["name","bool"],
            data:[['否',false],['是',true]]
        });
        this.callParent();
    }
});