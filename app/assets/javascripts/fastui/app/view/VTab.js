Ext.define('FastUI.view.VTab', {
    extend:'Ext.Panel',
    alias:'widget.vtab',
    title:'All VTabs',
    vfactory:null,
    layout:"card",
    initComponent:function () {
        this.title = this.vfactory.getVData().title;
        this.restHelper = Ext.create('FastUI.view.RestHelper', this.vfactory.getVData().model_class);
        this.tbar = Ext.create('Ext.toolbar.Toolbar', {
            items:[
                {   text:'新建',
                    handler:function () {
                        this.cmdCreate();
                    },
                    scope:this
                },
                { text:'编辑',
                    handler:function () {
                        this.cmdEdit();
                    }, scope:this},
                { text:'列表',
                    handler:function () {
                        this.cmdList();
                    }, scope:this},
                { text:'保存',
                    handler:function () {
                        this.cmdSave();
                    }, scope:this},
                { text:'删除',
                    handler:function () {
                        this.cmdDelete();
                    }, scope:this},
                { text:'帮助',
                    handler:function () {
                        alert('帮助');
                    }, scope:this}
            ]
        });
        this.callParent();
    },
    listeners:{
        activate:function (tab, opts) {
            this.cmdList();
        }
    },
    cmdList:function () {
        if (!this.grid) {
            this.grid = Ext.create('FastUI.view.VGrid', {vfactory:this.vfactory});
            this.add(this.grid);
        }

        this.grid.getStore().reload(); // 不一定每次都要刷新 需修改
        this.getLayout().setActiveItem(this.grid.id);
    },
    cmdCreate:function () {
        if (!this.form) {
            this.form = Ext.create('FastUI.view.VForm', {vfactory:this.vfactory});
            this.add(this.form);
        }
        this.getLayout().setActiveItem(this.form.id);
        var form = this.form.getForm();
        form.url = this.restHelper.getPath('create');
        form.method = 'POST';
        form.reset();
    },
    cmdEdit:function () {
        var record = this.grid.getSelectionModel().getSelection();
        if (record) this.currentRecord = record[0];
        if (!this.form) {
            this.form = Ext.create('FastUI.view.VForm', {vfactory:this.vfactory});
            this.add(this.form);
        }

        var form = this.form.getForm();
        form.url = this.restHelper.getPath('update', this.currentRecord.get('id'));
        form.method = 'PUT';

        Ext.Ajax.request({
            url:this.restHelper.getPath('edit', this.currentRecord.get('id')),
            success:function (response) {
                var data = Ext.decode(response.responseText);
                var k, o = {};
                for (k in data) {
                    o[this.restHelper.getName() + '[' + k + ']'] = data[k];
                }
                form.setValues(o);
            }, scope:this
        });
        this.getLayout().setActiveItem(this.form.id);
    },
    cmdDelete:function () {
        var record = this.grid.getSelectionModel().getSelection();
        if (record) this.currentRecord = record[0];
        Ext.MessageBox.confirm('提示', '确定要删除此记录吗?', function (btn) {
            if (btn == 'yes') {
                Ext.Ajax.request({
                    url:this.restHelper.getPath('delete', this.currentRecord.get('id')),
                    method:'DELETE',
                    success:function () {
                        this.cmdList();
                        Ext.MessageBox.alert("提示", "操作成功！")
                    },
                    failure:function () {
                        Ext.MessageBox.alert("提示", "操作失败！")
                    },
                    scope:this
                });
            }
        }, this)

    },
    cmdSave:function () {
        if (this.form) {
            var form = this.form.getForm();
            if (form.isValid()) {
//                form.submit({
//                    scope:this,
//                    success:function (form, action) {
//                        Ext.Msg.alert('Success', action.result.msg);
//                        this.cmdList();
//                    },
//                    failure:function (form, action) {
//                        Ext.Msg.alert('Failed', action.result.msg);
//                    }
//                });
                Ext.Ajax.request({
                    url:form.url,
                    method:form.method,
                    params:form.getValues(false, false,false),
                    success:function () {
                        this.cmdList();
                        Ext.MessageBox.alert("提示", "操作成功！")
                    },
                    failure:function () {
                        Ext.MessageBox.alert("提示", "操作失败！")
                    },
                    scope:this
                });
            }
        }
    },
    constructAjaxRequest:function(){

    }
});
