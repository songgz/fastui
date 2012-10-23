
Ext.define('FastUI.view.VWindow', {
    extend:'Ext.TabPanel',
    alias:'widget.vwindow',
    title:'The VWindow',
    mwindow:null,
    scope: this,
    listeners:{
        beforerender:function (vwindow, opts) {
            this.loadTabs(vwindow,opts);
        }
    },
    loadTabs:function (vwindow, opts) {
        vwindow.mwindow.m_tabs().each(function (mtab) {
            vwindow.add(Ext.create('FastUI.view.VTab', {title:mtab.get('title')}));
        });
    }
});

