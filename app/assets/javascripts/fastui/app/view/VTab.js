
Ext.define('FastUI.view.VTab', {
    extend:'Ext.Panel',
    alias:'widget.vtab',
    title:'All VTabs',
    mtab:null,
    listeners:{
        activate: function(tab, opts){
            this.loadGrid(tab, opts);
        }
    },
    loadGrid:function(tab, opts){
        tab.add(Ext.create('FastUI.view.VGrid'));
    },
    loadForm:function(tab,opts){
        tab.add(Ext.create('FastUI.view.VForm', {}));
    }
});
