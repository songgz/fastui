Ext.define('FastUI.view.VTab', {
    extend:'Ext.Panel',
    alias:'widget.vtab',
    title:'All VTabs',
    vfactory:null,
    layout: "card",
    initComponent:function(){
        this.title = this.vfactory.getVData().title;
        this.tbar =  Ext.create('Ext.toolbar.Toolbar', {
                    items:[
                        {   text:'新建',
                            handler:function () {
                                this.loadForm();
                            },
                            scope:this
                        },
                        { text:'编辑',
                            handler:function () {
                                alert('编辑');
                            }},
                        { text:'列表',
                            handler:function () {
                                this.loadGrid();
                            },scope:this},
                        { text:'保存',
                            handler:function () {
                                this.save();
                            },scope:this},
                        { text:'删除',
                            handler:function () {
                                alert('删除');
                            }},
                        { text:'帮助',
                            handler:function () {
                                alert('帮助');
                            }}
                    ]
                });
        this.callParent();
        },
    listeners:{
        activate:function (tab, opts) {
            this.loadGrid(tab, opts);
        }
    },
    loadGrid:function (tab, opts) {
        this.grid = this.grid || Ext.create('FastUI.view.VGrid', {vfactory:this.vfactory});
        this.add(this.grid);
        this.getLayout().setActiveItem(this.grid.id);
    },
    loadForm:function (tab, opts) {
        this.form = this.form || Ext.create('FastUI.view.VForm', {vfactory:this.vfactory})
        this.add(this.form);
        this.getLayout().setActiveItem(this.form.id);
    },
    save:function () {
                    var form = this.form.getForm();
                    if (form.isValid()) {
                        form.submit({
                            success:function (form, action) {
                                Ext.Msg.alert('Success', action.result.msg);
                            },
                            failure:function (form, action) {
                                Ext.Msg.alert('Failed', action.result.msg);
                            }
                        });
                    }
                }
});
