Ext.define('FastUI.view.VForm', {
    extend:'Ext.form.Panel',
    requires: ['FastUI.view.vfield.VFieldFactory'],
    tab:{},
    title:'Simple Form',
    bodyPadding:5,
    layout:'anchor',
    fieldDefaults: {
        labelAlign: 'left',
        labelWidth: 90,
        anchor: '60%'
    },
    defaultType:'textfield',
    border:false,
    initComponent:function () {
        this.title = this.getValue('title');
        this.items = this.getFFields();
        this.rest = Ext.create('FastUI.view.Rest', this.getMEntity());
        this.callParent();
    },
    getValue:function(key){
        return this.tab.valueObject[key];
    },
    getMEntity:function(){
        return this.tab.valueObject.entity;
    },
    getFFields:function () {
        var fields = [];
        Ext.each(this.getValue('members'), function (member) {
            member.readonly = member.readonly || false;
            member.display = member.display || 'all';
            if (member.display == 'all' || member.display == 'form'){
                fields.push(FastUI.view.vfield.VFieldFactory.buildField(member,this.tab.winCtx, this.tab.winId,this.tab.rest));
            }
        }, this);
        return fields;
    },
    cmdCreate: function () {
        var form = this.getForm();
        form.url = this.rest.createPath();
        form.method = 'POST';
        form.reset();
        this.setAutoFields(form);  //  有数据时要进行测试
    },
    setAutoFields: function (form) {
        var temp = {};
        var logic = "";
        Ext.each(this.getValue('m_fields'), function (mfield) {
            if (mfield.default_logic && mfield.default_logic.length > 0) {
                logic = this.winCtx.parseCtx(this.winId, mfield.default_logic);
                temp[this.rest.getTableName() + '[' + mfield.m_property.name + ']'] = Ext.decode(logic);
            }
        }, this);
        form.setValues(temp);
    },
    cmdEdit: function () {
        var id = this.tab.getVGrid().selectedId();
        var form = this.getForm();
        form.url = this.rest.updatePath(id);
        form.method = 'PUT';
        this.setEditValues(id, form);
    },
    setEditValues: function (id, form) {
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
    },
    cmdSave: function () {
            var form = this.getForm();
            if (form.isValid()) {
                this.constructAjaxRequest({
                    url: form.url,
                    method: form.method,
                    params: form.getValues(false, false, false),
                    success: function () {
                        Ext.MessageBox.alert("提示", "操作成功！")
                    },
                    failure: function () {
                        Ext.MessageBox.alert("提示", "操作失败！")
                    },
                    scope: this
                });
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