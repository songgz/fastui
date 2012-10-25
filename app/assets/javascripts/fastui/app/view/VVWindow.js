Ext.define('FastUI.view.VVWindow', {
    extend:'Ext.ux.tab.VerticalPanel',
    alias:'widget.vvwindow',
    title:'The VWindow',
    mwindow:null,
    //scope:this,
    //removePanelHeader:false,
    //border:false,
    activeTab:0,
    //plain:false,
    tabsConfig:{
        width:150,
        marginTop:5,
        textAlign:'right'
    },
    defaults:{autoScroll:true},
    listeners:{
        beforerender:function (vwindow, opts) {
            this.loadTabs(vwindow, opts)
        }
    },
    loadTabs:function (vwindow, opts) {
        vwindow.mwindow.mtabs().each(function (mtab) {
            var vTab = Ext.create('FastUI.view.VTab', {mtab:mtab, title:mtab.get('title')});
            vwindow.add(vTab);
        });
    }
});
