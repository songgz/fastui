Ext.define('FastUI.view.vfield.VSexSelect',{
    extend: 'Ext.form.RadioGroup',
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    width:300,

    initComponent:function(){
        this.fieldLabel = this.getFValue('title');
        this.disabled = this.getFValue('readonly');
        this.allowBlank = true;
        this.items = [
            { boxLabel: '男', name: this.rest.getTableName() + '[' + this.getFValue('name') + ']', inputValue: 'true', width:100 },
            { boxLabel: '女', name: this.rest.getTableName() + '[' + this.getFValue('name') + ']', inputValue: 'false', width:100 }
        ];
        this.callParent();
    },
    getFValue:function (key) {
        return this.valueObject[key];
    }
});