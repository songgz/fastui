Ext.define('FastUI.view.vfield.VLookUpWindow', {
    extend:'Ext.form.field.ComboBox',
    alias:'widget.vlookupwindow',
    editable:false,
    displayField:'title',
    valueField:'id',
    initComponent:function () {
        this.store = Ext.create('Ext.data.ArrayStore', {
            fields:['id', 'title'],
            data:[]
        });
        this.callParent();
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
        this.window = Ext.create('FastUI.view.VSearchWindow',{vlookup:this});
        this.window.show();
    }
});