Ext.define('FastUI.view.VLoginWindow', {
    extend:'Ext.window.Window',

    width:420,
    height:280,
    title:'用户登陆',
    closeAction:'hide',
    closable:false,
    iconCls:'fastui-login-title',
    layout:'fit',
    modal:true,
    layout:'border',
    resizable:false,
    autoShow:true,
    defaultFocus:'UserName',
    initComponent:function () {
        this.items = [
            {
                cls: 'fastui-login-header',
                baseCls:'x-plain',
                region:'north',
                height:80,
                border:false,
                html:'只允许授权用户访问。<br />' + '请输入用户名和密码。'
            },
            Ext.create('FastUI.view.VLoginForm')
        ];
        this.buttons = [
            {
                text:'重置',
                iconCls:'fastui-login-cancel',
                handler:function () {
                    this.child('form').getForm().reset();
                },
                scope:this
            },
            {
                text:'登录',
                iconCls:'fastui-login-submit',
                handler:function () {
                    this.doLogin();
                },
                scope:this
            }
        ];
        this.callParent(arguments);
    },
    doLogin:function () {
        var form = this.child('form').getForm();
        var win = this;
        if (form.isValid()) {
            form.submit({
                clientValidation:true,
                waitMsg:'请稍后',
                waitTitle:'正在验证登录',
                url:'/fastui/sessions/login.json',
                success:function (form, action) {
                    win.hide();
                    //Ext.getCmp('SystemMenus').store.load();
                },
                failure:function (form, action) {
                    Ext.MessageBox.show({
                        width:150,
                        title:"登录失败",
                        buttons:Ext.MessageBox.OK,
                        msg:action.result.msg
                    })
                }
            });
        }
    }

});