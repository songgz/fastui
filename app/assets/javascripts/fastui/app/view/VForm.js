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
    border:false,
    initComponent:function () {
        this.title = this.getValue('title');
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
        Ext.each(this.getValue('members'), function (member) {
            member.readonly = member.readonly || false;
            member.display = member.display || 'all';
            if (member.display == 'all' || member.display == 'form'){
                fields.push(FastUI.view.vfield.VFieldFactory.buildField(member,this.tab.winCtx, this.tab.winId,this.tab.rest));
            }
        }, this);
        return fields;
    }

});