Ext.define('FastUI.view.vfield.VLookup', {
    extend:'Ext.form.field.ComboBox',
    alias:'widget.vlookup',
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    triggerCls: Ext.baseCSSPrefix + 'form-search-trigger',
    editable:false,
    displayField:'title',
    valueField:'id',
    initComponent:function () {
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('name') + ']';
        this.disabled = this.getFValue('readonly') || false;
        this.allowBlank = this.getFValue('required') || true;
        this.width = this.getFValue('field_width') || 650;
        this.vtype = this.getFValue('vtype');
        this.store = Ext.create('Ext.data.ArrayStore', {
            fields:['id', 'title'],
            data:[]
        });
        this.callParent();
    },
    getDefaultValue: function(){
        return this.getFValue('default_logic');
    },
    getFValue:function (key) {
        return this.valueObject[key];
    },
    setValue:function(value){
        if(value && value.id && value.title){
            this.store.add(value);
            this.setValue(value.id);
        }else{
            this.callParent(arguments);
        }
    },

    onTriggerClick:function () {
        this.loadWindow();
    },
    loadWindow:function () {
        this.window = Ext.create('FastUI.view.VSearchWindow',{lookup:this});
        this.window.show();
    }
});