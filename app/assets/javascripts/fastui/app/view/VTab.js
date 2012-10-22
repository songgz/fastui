/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-16
 * Time: 下午4:24
 * To change this template use File | Settings | File Templates.
 */
Ext.define('FastUI.view.VTab', {
    extend:'Ext.Panel',
    alias:'widget.vtab',
    title:'All VTabs',
    mtab:null,
    scope: this,
    listeners:{
        activate:this.loadGrid
    },
    loadGrid:function(tab, opts){
      alert('sf');
        tab.add(Ext.create('FastUI.view.VGrid', {}));
    },
    loadForm:function(tab,opts){
        tab.add(Ext.create('FastUI.view.VForm', {}));
    }
});
