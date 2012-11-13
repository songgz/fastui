Ext.define('FastUI.view.vfield.VLookUpWindow', {
    extend:'Ext.form.field.Trigger',
    alias:'widget.vlookupwindow',

    // override onTriggerClick
    onTriggerClick:function () {
        this.loadWindow();

    },
    loadWindow:function () {
        Ext.create('Ext.window.Window', {
            title:'Hello',
            height:200,
            width:400,
            layout:'fit',
            items:{
                xtype:'grid',
                border:false,
                columns:['id', 'title'],
                store:this.getStore()
            }
        }).show();
    },
    getStore:function () {
        return new Ext.data.JsonStore({
            autoLoad:true,
            fields:['id', 'title'],
            proxy:{
                type:'ajax',
                url:'/fastui/' + Ext.util.Inflector.pluralize(this.entity_name) + '.json',
                reader:{
                    type:'json',
                    root:''
                }
            }

        });
    }

});