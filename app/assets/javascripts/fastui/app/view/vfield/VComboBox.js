Ext.define('FastUI.view.vfield.VComboBox', {
    extend:'Ext.form.field.ComboBox',
    requires:['FastUI.store.MListMgr'],
    valueField:'name',
    displayField:"title",
    forceSelection:true,
    triggerAction:'all',
    editable:false,
    selectOnFocus:true,

    initComponent:function () {
        //---set synchronous loading on this one to avoid problems with rendering
//        Ext.apply(Ext.data.Connection.prototype, {
//            async: false
//        });
        this.store = FastUI.store.MListMgr.getStore(this.list_id).load();
        //---restore async property to the default value
//        Ext.apply(Ext.data.Connection.prototype, {
//            async: true
//        });
        this.callParent();
    },
    setValue:function (value) {
        if(value && value.name && value.title){
            this.setValue(value.name);
        }else{
            this.callParent(arguments);
        }
    }

});