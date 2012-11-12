Ext.define('FastUI.view.vfield.VComboBox', {
    extend:'Ext.form.field.ComboBox',
    valueField:'name',
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
            proxy:{
                type:'ajax',
                url:'/fastui/m_glossary_items.json', //model_class
                reader:{
                    type:'json',
                    root:'',
                    id:'name'
                }
            },
            filters:[
                {property:"m_glossary_id", value:this.glossary_id}
            ],
            fields:['name', 'title','m_glossary_id']
        });
    }
});