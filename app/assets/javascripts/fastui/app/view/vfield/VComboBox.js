Ext.define('FastUI.view.vfield.VComboBox', {
    extend:'Ext.form.field.ComboBox',
    requires:['FastUI.store.MListMgr'],
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    valueField:'name',
    displayField:"title",
    forceSelection:true,
    triggerAction:'all',
    editable:false,
    selectOnFocus:true,

    initComponent:function () {
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('m_property').name + ']';
        this.disabled = this.getFValue('is_readonly');
        this.allowBlank = true;
        this.store = FastUI.store.MListMgr.getStore(this.getFValue('m_property').m_datatype_id);
        this.callParent();
    },
    getFValue:function (key) {
        return this.valueObject[key];
    },
    setValue:function (value) {
        if(value && value.name && value.title){
            this.setValue(value.name);
        }else{
            this.callParent(arguments);
        }
    }

});