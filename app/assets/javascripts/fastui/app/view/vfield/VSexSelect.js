Ext.define('FastUI.view.vfield.VSexSelect',{
    extend: 'Ext.form.field.ComboBox',
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    valueField:"sex_bool",
    displayField:"name",
    forceSelection: true,
    triggerAction: 'all',
    selectOnFocus:true,
    queryMode:"local",
    hiddenName:this.name,

    initComponent:function(){
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('m_property').name + ']';
        this.disabled = this.getFValue('is_readonly');
        this.allowBlank = true;
        this.store = Ext.create('Ext.data.ArrayStore',{
            fields: ["name","sex_bool"],
            data:[['男',true],['女',false]]
        });
        this.callParent();
    },
    getFValue:function (key) {
        return this.valueObject[key];
    }
});