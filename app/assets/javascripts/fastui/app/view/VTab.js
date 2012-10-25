
Ext.define('FastUI.view.VTab', {
    extend:'Ext.Panel',
    alias:'widget.vtab',
    title:'All VTabs',
    mtab:null,
    listeners:{
        activate: function(tab,opts){
            this.loadGrid(tab, opts);
        }
    },
    loadGrid:function(tab, opts){
        if(!this.grid){
            this.createToolBar(tab);
//            var gStore = Ext.create('Ext.data.Store', {
//                model: "FastUI.model.MWindow"
//            });
            this.grid = new Ext.create('FastUI.view.VGrid',{mtab:this.mtab});
            this.add(this.grid);
        }
        this.getLayout();
//        tab.add(Ext.create('FastUI.view.VGrid'));
    },
    loadForm:function(tab,opts){
        tab.add(Ext.create('FastUI.view.VForm', {}));
    },
    createToolBar:function(tab){
        var toolBar = Ext.create('Ext.toolbar.Toolbar', {
            items: [
                {   text: '新建' ,
                    handler:function(){
                     alert('新建');
            }},
                { text : '编辑',
                    handler:function(){
                        alert('编辑');
                    }},
                { text: '列表',
                    handler:function(){
                        alert('列表');
                    }},
                { text: '保存',
                    handler:function(){
                        alert('保存');
                    }},
                { text:'删除',
                    handler:function(){
                        alert('删除');
                    }},
                { text:'帮助',
                    handler:function(){
                        alert('帮助');
                    }} ]
        });
        tab.add(toolBar);
    }
});
