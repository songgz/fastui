Ext.define('FastUI.view.VTab', {
    extend:'Ext.Panel',
    alias:'widget.vtab',
    valueObject: {},
    winId:0,
    winCtx:{},
    vfactory:null,
    layout:"card",
    initComponent:function () {
        this.id = 'tab-' + this.getValue('id');
        this.title = this.getValue('title');
        this.rest = Ext.create('FastUI.view.Rest', this.getMEntity());
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
                        this.cmdHelp();
                    }, scope:this}
            ]
        });
        //FastUI.Env.setTabCtx(FastUI.Env.getWinCtx('winNo','win_id'),'tabNo','tab_id',this.id);
        this.callParent();
    },
    getValue:function(key){
        return this.valueObject[key];
    },
    getMEntity:function(){
        return this.valueObject.m_entity;
    },
    listeners:{
        activate:function (tab, opts) {
            this.cmdList();
        }
    },
    getParams:function () {
        var p = {};
            var tab = Ext.getCmp('tab-' + this.getValue('included_tab_id'));
            if(tab){
            var grid = tab.getVGrid();
            var id = grid.selectedId();
            if (id > 0){
                p[tab.rest.getTableName() + '_id'] = id;
            }
            }
        return p;
    },
    getVGrid:function(){
        if (!this.vgrid) {
            this.vgrid = Ext.create('FastUI.view.VGrid', {winCtx:this.winCtx,winId:this.winId,valueObject:this.valueObject,rest:this.rest});
            this.add(this.vgrid);
        }
        return this.vgrid;
    },
    cmdList:function () {
        var grid = this.getVGrid();
        //alert(typeof this.getValue('included_tab_id') );

//        if (this.getValue('included_tab_id') > 0) {
//            var store = grid.getStore();
//            var params1 = store.getProxy().extraParams;
//            var params2 = this.getParams();
//            //if (params1 != params2){
//                store.getProxy().extraParams = params2;
//                store.reload();
//            //}
//        }
        var id = grid.selectedId();
        var store = this.vgrid.getStore();
        store.getProxy().extraParams = this.getParams();
        store.reload({
            callback:function (records, operation, success) {
                if (id > 0) {
                    var rowIndex = store.find('id', id);  //where 'id': the id field of your model, record.getId() is the method automatically created by Extjs. You can replace 'id' with your unique field.. And 'this' is your store.
                    this.vgrid.getView().select(rowIndex);
                }
            },
            scope:this
        });
       this.getLayout().setActiveItem(this.vgrid.id);
    },
    getForm:function(){
        if (!this.vform) {
            this.vform = Ext.create('FastUI.view.VForm', {winCtx:this.winCtx,winId:this.winId,valueObject: this.valueObject});
            this.add(this.vform);
        }
        return this.vform.getForm();
    },
    cmdCreate:function () {
        var form = this.getForm();
        form.url = this.rest.createPath();
        form.method = 'POST';
        form.reset();
        this.getLayout().setActiveItem(this.vform.id);
    },
    cmdEdit:function () {
        var record = this.vgrid.getSelectionModel().getSelection();
        if (record) this.currentRecord = record[0];
        var form = this.getForm();
        form.url = this.rest.updatePath(this.currentRecord.get('id'));
        form.method = 'PUT';

        Ext.Ajax.request({
            url:this.rest.editPath(this.currentRecord.get('id')),
            success:function (response) {
                var data = Ext.decode(response.responseText);
                var k, o = {};
                for (k in data) {
                    if (k.indexOf('_id') > 0) {
                        var attr = data[k.replace('_id', '')];
                        var title = data[k];
                        if (attr && attr.title) {
                            title = attr.title
                        }
                        o[this.rest.getTableName() + '[' + k + ']'] = {id:data[k], title:title};
                    } else {
                        o[this.rest.getTableName() + '[' + k + ']'] = data[k];
                    }
                }

                form.setValues(o);
            }, scope:this
        });
        this.getLayout().setActiveItem(this.vform.id);
    },
    cmdDelete:function () {
        var record = this.vgrid.getSelectionModel().getSelection();
        if (record) this.currentRecord = record[0];
        Ext.MessageBox.confirm('提示', '确定要删除此记录吗?', function (btn) {
            if (btn == 'yes') {
                Ext.Ajax.request({
                    url:this.rest.deletePath(this.currentRecord.get('id')),
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
    cmdHelp:function () {
        var record = this.vgrid.getSelectionModel().getSelection();
        if (record) {
            this.currentRecord = record[0];
            var helpWindow = Ext.create('FastUI.view.VHelpWindow', {html:this.currentRecord.get('help')});
            helpWindow.show();
        }
    },
    cmdSave:function () {
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
                    url:form.url,
                    method:form.method,
                    params:form.getValues(false, false, false),
                    success:function () {
                        this.cmdList();
                        Ext.MessageBox.alert("提示", "操作成功！")
                    },
                    failure:function () {
                        Ext.MessageBox.alert("提示", "操作失败！")
                    },
                    scope:this
                })
            }
        }
    },
    constructAjaxRequest:function (options) {
        return Ext.Ajax.request({
            url:options.url,
            method:options.method,
            params:options.params,
            success:options.success,
            failure:options.failure,
            scope:options.scope
        });
    }
});
