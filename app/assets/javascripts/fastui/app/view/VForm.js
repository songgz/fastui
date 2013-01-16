Ext.define('FastUI.view.VForm', {
    extend:'Ext.form.Panel',
    requires: ['FastUI.view.vfield.VFieldFactory'],
    tab:{},
    title:'Simple Form',
    bodyPadding:5,
    layout:'anchor',
    fieldDefaults: {
        labelAlign: 'left',
        labelWidth: 90,
        anchor: '60%'
    },
    defaultType:'textfield',
    border:true,
    initComponent:function () {
        this.title = this.getValue('title');
        //this.url = this.vfactory.getUrl();
        this.items = this.getFFields();
        this.callParent();
    },
    getValue:function(key){
        return this.tab.valueObject[key];
    },
    getMEntity:function(){
        return this.tab.valueObject.m_entity;
    },
    getFFields:function () {
        var fields = [];
        Ext.each(this.getValue('m_fields'), function (field) {
            fields.push(FastUI.view.vfield.VFieldFactory.buildField(field,this.tab.winCtx, this.tab.winId,this.tab.rest));
        }, this);
        return fields;
    }

});