Ext.define('FastUI.view.vfield.VComboBox', {
    extend:'Ext.form.field.ComboBox',
    requires:['FastUI.store.MGlossaryMgr'],
    valueField:'id',
    displayField:"title",
    forceSelection:true,
    triggerAction:'all',
    editable:false,
    selectOnFocus:true,

    initComponent:function () {
        this.store = FastUI.store.MGlossaryMgr.getStore(this.glossary_id);
        this.callParent();
    },
    setValue:function (value) {
        if(value && value.id && value.title){
            this.setValue(value.id);
        }else{
            this.callParent(arguments);
        }
    }

});