Ext.define('FastUI.view.VTab', {
    extend:'Ext.Panel',
    alias:'widget.vtab',
    title:'All VTabs',
    vfactory:null,
    layout:"card",
    initComponent:function () {
        this.title = this.vfactory.getVData().title;
        this.tbar = Ext.create('Ext.toolbar.Toolbar', {
            items:[
                {   text:'新建',
                    handler:function () {
                        this.loadForm();
                    },
                    scope:this
                },
                { text:'编辑',
                    handler:function () {
                        this.cmdEdit();
                    }, scope:this},
                { text:'列表',
                    handler:function () {
                        this.loadGrid();
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
            this.loadGrid();
        }
    },
    loadGrid:function () {
        if (!this.grid) {
            this.grid = Ext.create('FastUI.view.VGrid', {vfactory:this.vfactory});
            this.add(this.grid);
        }

        this.grid.getStore().reload(); // 不一定每次都要刷新 需修改
        this.getLayout().setActiveItem(this.grid.id);
    },
    loadForm:function () {
        if (!this.form) {
            this.form = Ext.create('FastUI.view.VForm', {vfactory:this.vfactory});
            this.add(this.form);
        }
        this.getLayout().setActiveItem(this.form.id);
        this.form.getForm().reset();
    },
    cmdEdit:function () {
        var record = this.grid.getSelectionModel().getSelection();
        if (record) this.currentRecord = record[0];
        if (!this.form) {
            this.form = Ext.create('FastUI.view.VForm', {vfactory:this.vfactory, title:'编辑'});
            this.add(this.form);
        }
        alert(this.currentRecord.get('id'));
//        this.form.url = "/fastui/m_windows/" + this.currentRecord.get('id') + ".json";
        this.form.url = this.get_url('update');
        this.form.method = 'PUT';
        Ext.Ajax.request({
//            url:"/fastui/m_windows/" + this.currentRecord.get('id') + "/edit.json",
            url:this.get_url('edit'),
            success:function (response) {
                var data = Ext.decode(response.responseText);
                var k, o = {};
                for (k in data) {
                    o['m_window[' + k + ']'] = data[k];
                }
                this.form.getForm().setValues(o);
            }, scope:this
        });
        this.getLayout().setActiveItem(this.form.id);
    },
    cmdDelete:function () {
        var record = this.grid.getSelectionModel().getSelection();
        if (record) this.currentRecord = record[0];
        var opt = {msg:'确定要删除%吗?', method:'DELETE'}
        var msg = (opt.msg || "确定要" + opt.getName() + "%吗?").replace(new RegExp('%'), "tt")
        Ext.MessageBox.confirm('提示', msg, function (btn) {
            if (btn == 'yes') {
                Ext.Ajax.request({
//                    url:"/fastui/m_windows/" + this.currentRecord.get('id') + ".json",
                    url:this.get_url('delete'),
                    method:opt.method || 'GET',
                    success:function () {
                        this.loadGrid();
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
                form.submit({
                    url:this.form.url,
                    method:this.form.method,
                    scope:this,
                    success:function (form, action) {
                        Ext.Msg.alert('Success', action.result.msg);
                        this.loadGrid();
                    },
                    failure:function (form, action) {
                        Ext.Msg.alert('Failed', action.result.msg);
                    }
                });
            }
        }
    },
    get_url:function (action, event_name, record) {
        var url = '/fastui/m_windows';
        if (record) this.currentRecord = record;
        switch (action) {
            case "index":
                return url + ".json";
                break;
            case "create":
                return url + ".json";
                break;
            case "update":
                return url + "/" + this.currentRecord.get('id') + ".json";
                break;
            case "edit":
                return url + "/" + this.currentRecord.get('id')  + "/edit.json";
                break;
            case "delete":
                return url + "/" + this.currentRecord.get('id')  + ".json";
                break;
            case "special":
                return url + "/" + this.currentRecord.get('id')  + "/" + event_name + ".json";
                break;
        }
    }
});
