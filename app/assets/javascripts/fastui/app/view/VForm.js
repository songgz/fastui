Ext.define('FastUI.view.VForm', {
    extend:'Ext.form.Panel',
    requires: ['FastUI.view.vfield.VFieldFactory'],
    valueObject: {},
    title:'Simple Form',
    bodyPadding:5,
    url:'',
    layout:'anchor',
    defaults:{
        anchor:'60%'
    },
    defaultType:'textfield',

    initComponent:function () {
        this.title = this.getValue('title');
        //this.url = this.vfactory.getUrl();
        this.items = this.getFFields();
        this.callParent();
    },
    getValue:function(key){
        return this.valueObject[key];
    },
    getMEntity:function(){
        return this.valueObject.m_entity;
    },
    getFFields:function () {
//        if (!Ext.isEmpty(this.getVData().included_tab_id)) {
//            var tab = Ext.getCmp('tab_' + this.getVData().included_tab_id);
//            if (tab && tab.grid) {
//                var records = tab.grid.getSelectionModel().getSelection();
////                alert(Ext.encode(records[0].getData()));
//                FastUI.Env.set('m_entity_id',records[0].get('m_entity_id'));
//                FastUI.Env.set('m_window_id',records[0].get('m_window_id'));
////                m_entity_id = records[0].get('m_entity_id');
////                m_window_id = records[0].get('m_window_id');
////                alert(records[0].get('m_window_id'));
//            }
//        }
        var fields = [];
        Ext.each(this.getValue('m_fields'), function (field) {
            fields.push(FastUI.view.vfield.VFieldFactory.buildField(field,this.getMEntity()));
        }, this);
        return fields;
    }

});