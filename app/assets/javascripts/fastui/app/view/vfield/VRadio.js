Ext.define('FastUI.view.vfield.VRadio',{
    extend: 'Ext.form.RadioGroup',
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},
    width:300,

    initComponent:function(){
        this.fieldLabel = this.getFValue('title');
        this.disabled = this.getFValue('readonly') || false;
        this.allowBlank = this.getFValue('required') || true;
        this.width = this.getFValue('field_width') || 650;
        this.vtype = this.getFValue('vtype');
        this.items = this.getFFields();
        this.callParent();
    },
    getFValue:function (key) {
        return this.valueObject[key] || '';
    },
    getFFields:function(){
        var fields = [];
        var store = FastUI.store.MListMgr.getStore(this.getFValue('name'));
        store.each(function(item, index, count) {
            fields.push({
                name: this.rest.getTableName() + '[' + this.getFValue('name') + ']',
                boxLabel: item.data.title,
                inputValue: item.data.name,
                width:100
            });
        },this);
        return fields;
    }

});

