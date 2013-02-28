Ext.define('FastUI.view.VTab', {
    extend: 'Ext.Panel',
    alias: 'widget.vtab',
    valueObject: {},
    winId: 0,
    winCtx: {},
    layout: "card",
    border: true,
    initComponent: function () {
        this.id = 'tab-' + this.getValue('id');
        this.title = this.getValue('level') + this.getValue('title');
        this.rest = Ext.create('FastUI.view.Rest', this.getMEntity().name);
        this.tbar = Ext.create('Ext.toolbar.Toolbar', {
            id: this.id + 'tbar',
            defaults: {
                scale: 'small' //scale: 'large'
            },
            items: [
                {
                    id: this.id + 'new',
                    text: '新建',
                    iconCls: 'fastui-btn-new',
                    handler: function () {
                        this.cmdCreate();
                        this.getBtn('save').enable();
                        this.getBtn('edit').disable();
                    },
                    scope: this
                },
                {
                    id: this.id + 'edit',
                    text: '编辑',
                    disabled: true,
                    iconCls: 'fastui-btn-edit',
                    handler: function () {
                        this.cmdEdit();
                        this.getBtn('save').enable();
                        this.getBtn('new').disable();
                    },
                    scope: this
                },
                {
                    id: this.id + 'list',
                    text: '列表',
                    iconCls: 'fastui-btn-list',
                    handler: function () {
                        this.cmdList();
                        this.getBtn('save').disable();
                        this.getBtn('new').enable();
                    },
                    scope: this
                },
                {
                    id: this.id + 'save',
                    text: '保存',
                    disabled: true,
                    iconCls: 'fastui-btn-save',
                    handler: function () {
                        this.cmdSave();
                        this.getBtn('save').disable();
                    },
                    scope: this
                },
                {
                    id: this.id + 'del',
                    text: '删除',
                    disabled: true,
                    iconCls: 'fastui-btn-del',
                    handler: function () {
                        this.cmdDelete();
                        this.getBtn('edit').disable();
                    },
                    scope: this
                },
                {
                    id: this.id + 'help',
                    text: '帮助',
                    iconCls: 'fastui-btn-help',
                    handler: function () {
                        this.cmdHelp();
                    },
                    scope: this
                }
            ]
        });
        //FastUI.Env.setTabCtx(FastUI.Env.getWinCtx('winNo','win_id'),'tabNo','tab_id',this.id);
        this.callParent();
    },
    getBtn: function (name) {
        return this.getDockedComponent(this.id + 'tbar').items.get(this.id + name);
    },
    getValue: function (key) {
        return this.valueObject[key];
    },
    getMEntity: function () {
        return this.valueObject.m_entity;
    },
    listeners: {
        activate: function (tab, opts) {
            this.cmdList();
        }
    },
    getParams: function () {
        var p = {};
        var tab = Ext.getCmp('tab-' + this.getValue('included_tab_id'));
        if (tab) {
            //p[tab.rest.getKey()] = tab.getSelectedId();
            p[tab.rest.getKey()] = this.winCtx.getWinCtx(this.winId, tab.rest.getKey());
        }
        return p;
    },
    getVGrid: function () {
        if (!this.vgrid) {
            this.vgrid = Ext.create('FastUI.view.VGrid', {tab: this});
            this.add(this.vgrid);
        }
        return this.vgrid;
    },
    getSelectedId: function () {
        return this.getVGrid().selectedId();
    },
    cmdList: function () {
        var grid = this.getVGrid();
        var store = grid.getStore();

//        var params1 = store.getProxy().extraParams;
//        var params2 = this.getParams();
//        if (Ext.encode(params1) !== Ext.encode(params2)) {
//            //alert(Ext.encode(params1) + Ext.encode(params2));
//            store.getProxy().extraParams = params2;
//            store.reload();
//        }

        var id = grid.selectedId();
        store.getProxy().extraParams = this.getParams();
        store.reload({
            callback: function (records, operation, success) {
                var rowIndex = store.find('id', id);  //where 'id': the id field of your model, record.getId() is the method automatically created by Extjs. You can replace 'id' with your unique field.. And 'this' is your store.
                if (rowIndex > -1) {
                    this.vgrid.getView().select(rowIndex);
                    this.getBtn('edit').enable();
                }
            },
            scope: this
        });
        this.getLayout().setActiveItem(this.vgrid.id);
    },
    getForm: function () {
        if (!this.vform) {
            this.vform = Ext.create('FastUI.view.VForm', {tab: this});
            this.add(this.vform);
        }
        return this.vform.getForm();
    },
    cmdCreate: function () {
        var form = this.getForm();
        form.url = this.rest.createPath();
        form.method = 'POST';
        form.reset();
        var temp = {};
        var logic = "";
        Ext.each(this.getValue('m_fields'), function (mfield) {
            if (mfield.default_logic.length > 0) {
                logic = this.winCtx.parseCtx(this.winId, mfield.default_logic);
                temp[this.rest.getTableName() + '[' + mfield.m_property.name + ']'] = Ext.decode(logic);
            }
        }, this);
        form.setValues(temp);
        this.getLayout().setActiveItem(this.vform.id);
    },
    cmdEdit: function () {
        var id = this.getVGrid().selectedId();
        var form = this.getForm();
        form.url = this.rest.updatePath(id);
        form.method = 'PUT';

        Ext.Ajax.request({
            url: this.rest.editPath(id),
            success: function (response) {
                var data = Ext.decode(response.responseText);
                var k, o = {};
                for (k in data) {
                        if (k.match(/_id$/)) {
                        var attr = data[k.replace('_id', '')];
                        var title = data[k];
                        if (attr && attr.title) {
                            title = attr.title
                        }
                        o[this.rest.getTableName() + '[' + k + ']'] = {id: data[k], title: title};
                        } else if (k.match(/_ids$/)) {
                        o[this.rest.getTableName() + '[' + k + '][]'] = data[k];
                    }
                    else {
                        o[this.rest.getTableName() + '[' + k + ']'] = data[k];
                    }
                }
//                alert(Ext.encode(o));
                form.setValues(o);
            }, scope: this
        });
        this.getLayout().setActiveItem(this.vform.id);
    },
    cmdDelete: function () {
        var id = this.getVGrid().selectedId();
        Ext.MessageBox.confirm('提示', '确定要删除此记录吗?', function (btn) {
            if (btn == 'yes') {
                Ext.Ajax.request({
                    url: this.rest.deletePath(id),
                    method: 'DELETE',
                    success: function () {
                        this.cmdList();
                        Ext.MessageBox.alert("提示", "操作成功！")
                    },
                    failure: function () {
                        Ext.MessageBox.alert("提示", "操作失败！")
                    },
                    scope: this
                });
            }
        }, this)

    },
    cmdHelp: function () {
        var helpWindow = Ext.create('FastUI.view.VHelpWindow', {html: this.getValue('help')});
        helpWindow.show();
    },
    cmdSave: function () {
        if (this.vform) {
            var form = this.getForm();
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
//                Ext.Ajax.request({
//                    url:form.url,
//                    method:form.method,
//                    params:form.getValues(false, false,false),
//                    success:function () {
//                        this.cmdList();
//                        Ext.MessageBox.alert("提示", "操作成功！")
//                    },
//                    failure:function () {
//                        Ext.MessageBox.alert("提示", "操作失败！")
//                    },
//                    scope:this
//                });
                this.constructAjaxRequest({
                    url: form.url,
                    method: form.method,
                    params: form.getValues(false, false, false),
                    success: function () {
                        this.cmdList();
                        Ext.MessageBox.alert("提示", "操作成功！")
                    },
                    failure: function () {
                        Ext.MessageBox.alert("提示", "操作失败！")
                    },
                    scope: this
                })
            }
        }
    },
    constructAjaxRequest: function (options) {
        return Ext.Ajax.request({
            url: options.url,
            method: options.method,
            params: options.params,
            success: options.success,
            failure: options.failure,
            scope: options.scope
        });
    }
});
