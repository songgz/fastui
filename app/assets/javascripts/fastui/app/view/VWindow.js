
Ext.define('FastUI.view.VWindow', {
    extend:'Ext.TabPanel',
    alias:'widget.vwindow',
    title:'The VWindow',
    mwindow:null,
    scope: this,
    listeners:{
        beforerender:function (vwindow, opts) {
            this.loadTabs(vwindow,opts);
            vwindow.mwindow.mtabs = [{title:'ksksk'}]
            Ext.Array.each(vwindow.mwindow.mtabs, function(mtab, index, mtabs) {
                vwindow.add(Ext.create('FastUI.view.VTab', {title:mtab.title}));
            });
        }
    },
    loadTabs:function (vwindow, opts) {
        alert(vwindow);
        vwindow.mwindow.mtabs.each(function (mtab) {
            vwindow.add(Ext.create('FastUI.view.VTab', {title:mtab.get('title')}));
        });
    }
});

