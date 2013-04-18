Ext.define('FastUI.view.vfield.VYesOrNo',{
    extend: 'Ext.form.field.ComboBox',
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    valueField:"bool",
    displayField:"name",
    forceSelection: true,
    triggerAction: 'all',
    selectOnFocus:true,
    queryMode:"local",
    hiddenName:this.name,

    initComponent:function(){
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('name') + ']';
        this.disabled = this.getFValue('readonly');
        this.allowBlank = true;
        this.store = Ext.create('Ext.data.ArrayStore',{
            fields: ["name","bool"],
            data:[['否',false],['是',true]]
        });
        this.callParent();
    },
    getFValue:function (key) {
        return this.valueObject[key];
    }
});