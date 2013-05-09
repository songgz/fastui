Ext.define('FastUI.view.VTab', {
    extend: 'Ext.Panel',
    requires: ['FastUI.view.FormFactory'],
    alias: 'widget.vtab',
    valueObject: {},
    winId: 0,
    winCtx: {},
    layout: "card",
    border: false,
    initComponent: function () {
        this.id = 'tab-' + this.getValue('name');
        this.grid_kind = this.getValue('grid_kind');
        this.title = this.getValue('title');
        this.form_kind = this.getValue('form_kind');
        this.rest = Ext.create('FastUI.view.Rest', this.getMEntity());
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
//                        this.cmdCreate();
                        this.getForm();
                        this.vform.cmdCreate();
                        this.getLayout().setActiveItem(this.vform.id);

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
                        this.getForm();
                        this.vform.cmdEdit();
                        this.getLayout().setActiveItem(this.vform.id);

//                        this.cmdEdit();
                        this.getBtn('save').enable();
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
                        this.getBtn('edit').enable();
                    },
                    scope: this
                },
                {
                    id: this.id + 'save',
                    text: '保存',
                    disabled: true,
                    iconCls: 'fastui-btn-save',
                    handler: function () {
//                        this.cmdSave();
                        this.getForm();
                        this.vform.cmdSave();
                        this.vgrid.store.reload();
                        this.getLayout().setActiveItem(this.vgrid.id);
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
        return this.valueObject[key] || '';
    },
    getMEntity: function () {
        return this.valueObject.entity;
    },
    listeners: {
        activate: function (tab, opts) {
            this.cmdList();
        }
    },
    getParams: function () {
        var p = {};
        var tab = Ext.getCmp('tab-' + this.getValue('included_tab'));
        if (tab) {
            //p[tab.rest.getKey()] = tab.getSelectedId();
            //alert( tab.rest.getKey());
            p[tab.rest.getKey()] = this.winCtx.getWinCtx(this.winId, tab.rest.getKey());
        }
        return p;
    },
    getVGrid: function () {
        if (!this.vgrid) {
            if (this.grid_kind == 'VTreeGrid') {
                this.vgrid = Ext.create('FastUI.view.VTreeGrid', {tab: this});
            } else {
                this.vgrid = Ext.create('FastUI.view.VGrid', {tab: this});
            }
            this.add(this.vgrid);
        } else {
            if (this.grid_kind != 'VTreeGrid') {
                var params1 = this.vgrid.store.getProxy().extraParams;
                var params2 = this.getParams();
                if (!Ext.Object.equals(params1, params2)) {
                    this.vgrid.store.getProxy().extraParams = params2;
                    this.vgrid.store.reload();
                }
            }
        }
        return this.vgrid;
    },
    getSelectedId: function () {
        return this.getVGrid().selectedId();
    },
    cmdList: function () {
        var grid = this.getVGrid();
        this.getLayout().setActiveItem(grid.id);
    },
    getForm: function () {
        if (!this.vform) {
            this.vform = FastUI.view.FormFactory.createForm(this.form_kind, this);
            this.add(this.vform);
        }
        return this.vform.getForm();
//            if (this.form_kind == '') {
//                if (!this.vform) {
//                    this.vform = Ext.create('FastUI.view.VForm', {tab: this});
//                    this.add(this.vform);
//                }
//            } else {
//                this.vform = Ext.create('FastUI.view.' + this.form_kind, {tab: arguments.length == 0 ? this : arguments[0]});
//            }


    },
//    cmdCreate: function () {
//        var form = this.getForm();
//        form.url = this.rest.createPath();
//        form.method = 'POST';
//        form.reset();
////        if (this.form_kind == '') {
//        this.setAutoFields(form);
////        }
//        this.getLayout().setActiveItem(this.vform.id);
//    },
//    setAutoFields: function (form) {
//        var temp = {};
//        var logic = "";
//        Ext.each(this.getValue('m_fields'), function (mfield) {
//            if (mfield.default_logic && mfield.default_logic.length > 0) {
//                logic = this.winCtx.parseCtx(this.winId, mfield.default_logic);
//                temp[this.rest.getTableName() + '[' + mfield.m_property.name + ']'] = Ext.decode(logic);
//            }
//        }, this);
//        form.setValues(temp);
//    },
//    cmdEdit: function () {
//        var id = this.getVGrid().selectedId();
////        if (this.form_kind == '') {
//        var form = this.getForm();
//        form.url = this.rest.updatePath(id);
//        form.method = 'PUT';
//        this.setEditValues(id, form);
//        this.getLayout().setActiveItem(this.vform.id);
////        } else {
////            Ext.Ajax.request({
////                url: this.rest.editPath(id),
////                success: function (response) {
////                    this.getForm(Ext.decode(response.responseText));
////                    this.getLayout().setActiveItem(this.vform.id);
////                }.bind(this)
////            });
////        }
////        this.getLayout().setActiveItem(this.vform.id);
//    },
//    setEditValues: function (id, form) {
//        Ext.Ajax.request({
//            url: this.rest.editPath(id),
//            success: function (response) {
//                var data = Ext.decode(response.responseText);
//                var k, o = {};
//                for (k in data) {
//                    if (k.match(/_id$/)) {
//                        var attr = data[k.replace('_id', '')];
//                        var title = data[k];
//                        if (attr && attr.title) {
//                            title = attr.title
//                        }
//                        o[this.rest.getTableName() + '[' + k + ']'] = {id: data[k], title: title};
//                    } else if (k.match(/_ids$/)) {
//                        o[this.rest.getTableName() + '[' + k + '][]'] = data[k];
//                    }
//                    else {
//                        o[this.rest.getTableName() + '[' + k + ']'] = data[k];
//                    }
//                }
////                alert(Ext.encode(o));
//                form.setValues(o);
//            }, scope: this
//        });
//    },
    cmdDelete: function () {
        var id = this.getVGrid().selectedId();
        Ext.MessageBox.confirm('提示', '确定要删除此记录吗?', function (btn) {
            if (btn == 'yes') {
                this.constructAjaxRequest({
                    url: this.rest.deletePath(id),
                    method: 'DELETE',
                    success: function () {
                        this.vgrid.store.reload();
                        this.getLayout().setActiveItem(this.vgrid.id);
                        Ext.MessageBox.alert("提示", "操作成功！")
                    },
                    failure: function () {
                        Ext.MessageBox.alert("提示", "操作失败！")
                    },
                    scope: this
                });
            }
        }, this);
    },
    cmdHelp: function () {
        var helpWindow = Ext.create('FastUI.view.VHelpWindow', {html: this.getValue('help')});
        helpWindow.show();
    },
//    cmdSave: function () {
//        if (this.vform) {
//            var form = this.getForm();
//            if (form.isValid()) {
//                this.constructAjaxRequest({
//                    url: form.url,
//                    method: form.method,
//                    params: form.getValues(false, false, false),
//                    success: function () {
//                        this.vgrid.store.reload();
//                        this.getLayout().setActiveItem(this.vgrid.id);
//                        Ext.MessageBox.alert("提示", "操作成功！")
//                    },
//                    failure: function () {
//                        Ext.MessageBox.alert("提示", "操作失败！")
//                    },
//                    scope: this
//                });
//            }
//        }
//    },
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
