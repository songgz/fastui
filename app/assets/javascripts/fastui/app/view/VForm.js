Ext.define('FastUI.view.VForm', {
    extend:'Ext.form.Panel',
    title:'Simple Form',
    bodyPadding:5,
    url:'',
    layout:'anchor',
    defaults:{
        anchor:'100%'
    },
    defaultType:'textfield',

    initComponent:function () {
        this.title = this.vfactory.getVData().title;
        this.url = this.vfactory.getUrl();
        this.items = this.vfactory.getFormFields();
        this.callParent();
    }

});