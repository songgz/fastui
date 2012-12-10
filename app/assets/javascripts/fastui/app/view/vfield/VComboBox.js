Ext.define('FastUI.view.vfield.VComboBox', {
    extend:'Ext.form.field.ComboBox',
    requires:['FastUI.store.MGlossaryMgr'],
    valueField:'name',
    displayField:"title",
    forceSelection:true,
    triggerAction:'all',
    editable:false,
    selectOnFocus:true,

    initComponent:function () {
        //---set synchronous loading on this one to avoid problems with rendering
        Ext.apply(Ext.data.Connection.prototype, {
            async: false
        });
        this.store = FastUI.store.MGlossaryMgr.getStore(this.glossary_id).load();
        //---restore async property to the default value
        Ext.apply(Ext.data.Connection.prototype, {
            async: true
        });
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