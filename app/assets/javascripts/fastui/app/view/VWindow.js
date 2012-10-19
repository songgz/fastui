
Ext.define('FastUI.view.VWindow', {
    extend:'Ext.TabPanel',
    alias:'widget.vwindow',
    title:'The VWindow',
    mwindow:null,
    listeners:{
        beforerender:function (vwindow, opts) {
            vwindow.mwindow.mtabs = [{title:'ksksk'}]
            Ext.Array.each(vwindow.mwindow.mtabs, function(mtab, index, mtabs) {
                vwindow.add(Ext.create('FastUI.view.VTab', {title:mtab.title}));
            });
        }
    },
    loadTabs:function (vwindow, opts) {
        vwindow.mwindow.mtabs.each(function (mtab) {
            vwindow.add(Ext.create('FastUI.view.VTab', {title:mtab.get('title')}));
        });
    }
});

