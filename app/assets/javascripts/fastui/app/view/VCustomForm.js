Ext.define('FastUI.view.VCustomForm', {
    extend:'Ext.Panel',

    successText:'Success',
    failureText:'Failed',
    invalidText:'Invalid',

    tab:{},
    url: 'fastui',
    method: 'POST',
    autoEl: {tag: 'form'},
    title:'Custom Form',
    bodyPadding:5,
    layout:'anchor',
    border:false,
    html:'<input name="s11" /> <input name="g22" />',

    initComponent:function () {
        this.title = this.getValue('title');
        this.callParent();
    },
    getValue:function(key){
        return this.tab.valueObject[key];
    },
    getMEntity:function(){
        return this.tab.valueObject.entity;
    },
    cmdEdit: function () {
        var id = this.tab.getVGrid().selectedId();
        this.url = this.tab.rest.updatePath(id);
        this.method = 'PUT';
        Ext.Ajax.request({
            url: this.tab.rest.editPath(id),
            success: function (response) {
                var data = Ext.decode(response.responseText);
                this.setValues(data);
            },
            failure: function () {
                Ext.MessageBox.alert(this.failureText, "操作失败！")
            },
            scope: this
        });
    },
    cmdCreate:function(){
        this.getChildCreate();
        this.url = this.tab.rest.createPath();
        this.method = 'POST';
    },
    cmdSave:function(){
        Ext.Ajax.request( {
            url : this.url,
            method : this.method,
            form : this.id,
            success: function () {
                this.tab.vgrid.refresh();
                Ext.MessageBox.alert(this.successText, "操作成功！");
            },
            failure: function () {
                Ext.MessageBox.alert(this.failureText, "操作失败！")
            },
            scope: this
        });
    },
    setValues: function (opt) {

    },
    getChildCreate:function(){

    }

});