Ext.define('FastUI.view.vfield.VComboBox', {
    extend:'Ext.form.field.ComboBox',
    valueField:'id',
    displayField:"title",
    forceSelection:true,
    triggerAction: 'all',
    editable: false,
    selectOnFocus:true,

    initComponent:function () {
        this.store = this.getStore();
        this.callParent();
    },
    getStore:function () {
        return new Ext.data.JsonStore({
            autoLoad: true,
            fields:['id','name', 'title'],
            proxy:{
                type:'ajax',
                url:'/fastui/m_glossaries/' + this.glossary_id + '/m_glossary_items.json', //model_class
                reader:{
                    type:'json',
                    root:''
                }
            }

        });
    }
});