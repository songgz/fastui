/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-16
 * Time: 下午4:24
 * To change this template use File | Settings | File Templates.
 */


Ext.define('FastUI.view.VWindow', {
    extend:'Ext.TabPanel',
    alias:'widget.vwindow',
    title:'The VWindow',
    mwindow:null,
    listeners:{
        beforerender:this.loadTabs
    },
    loadTabs:function (vwindow, opts) {
        vwindow.mwindow.mtabs.each(function (mtab) {
            vwindow.add(Ext.create('FastUI.view.VTab', {title:mtab.get('title')}));
        });
    }
});

