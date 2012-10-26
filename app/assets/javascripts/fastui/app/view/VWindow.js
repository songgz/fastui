Ext.define('FastUI.view.VWindow', {
    extend:'Ext.TabPanel',
    alias:'widget.vwindow',
    initComponent:function(){
        this.title = this.vfactory.getVData().title;
        this.callParent();
    },
    listeners:{
        beforerender:function (vwindow, opts) {
            this.loadTabs(vwindow, opts)
        }
    },
    loadTabs:function (vwindow, opts) {
        Ext.each(this.vfactory.getVData().m_tabs,function(mtab){
            var vTab =  Ext.create('FastUI.view.VTab', {vfactory: Ext.create('FastUI.view.VFactory',mtab)} );
            vwindow.add(vTab);
        });
    }
});

