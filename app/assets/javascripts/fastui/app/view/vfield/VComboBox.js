Ext.define('FastUI.view.vfield.VComboBox', {
    extend:'Ext.form.field.ComboBox',
    requires:['FastUI.store.MGlossaryMgr'],
    valueField:'name',
    displayField:"title",
    forceSelection:true,
    triggerAction:'all',
    editable:false,
    selectOnFocus:true,
    typeAhead: true,
    selectOnTab: true,
    lazyRender: true,
                    listClass: 'x-combo-list-small',


    initComponent:function () {
        this.store = FastUI.store.MGlossaryMgr.getStore(this.glossary_id);
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