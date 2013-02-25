Ext.define('FastUI.view.VLoginForm', {
    extend:'Ext.form.Panel',
    alias:'widget.loginForm',

    header: false,
    region: 'center',
    border:false,
    bodyPadding:10,
    fieldDefaults:{
        labelAlign:'left',
        labelWidth: 75,
        labelStyle:'font-weight:bold'
    },
    layout: {
        type: 'vbox',
        align: 'stretch'
    },
    //defaultFocus:'UserName',
    items:[
        {
            xtype      : 'fieldcontainer',
            fieldLabel : '用户类型',
            defaultType: 'radiofield',
            defaults: {
                flex: 1
            },
            layout: 'hbox',
            items: [
                {
                    boxLabel  : '教师',
                    name      : 'type',
                    inputValue: 'Teacher',
                    id        : 'teacher'
                }, {
                    boxLabel  : '学生',
                    name      : 'type',
                    inputValue: 'Student',
                    id        : 'student'
                }, {
                    boxLabel  : '家长',
                    name      : 'type',
                    inputValue: 'Guardian',
                    id        : 'guardian'
                },{
                    boxLabel  : '管理员',
                    name      : 'type',
                    inputValue: 'Fastui::MPerson',
                    id        : 'person'
                }
            ]
        },
        {
            xtype:'textfield',
            fieldLabel:'用户名',
            blankText:'用户名不能为空',
            name:'username',
            id:'username',
            allowBlank:false,
            width:240
        },
        {
            xtype:'textfield',
            fieldLabel:'密　码',
            allowBlank:false,
            blankText:'密码不能为空',
            name:'password',
            id:'password',
            width:240,
            inputType:'password'
        },
        {
            xtype: 'box',
            autoEl: {
                html: '<div style="text-align: right;"><a href="about:blank" target="_blank">忘记密码了吗？</a></div>'
            }
        },

        {
            xtype: 'checkbox',
            itemId: 'rememberMe',
            name: 'data[User][rememberme]',
            padding: '0 0 0 80',
            boxLabel: '记住我！',
            listeners: {
                render: function(checkbox) {
//                    checkbox.bodyEl.child('input').set({
//                        'data-qtip': this.qtips.rememberme
//                    });
                },
                scope: this
            }
        }

    ],
    initComponent:function () {

        this.callParent(arguments);
    }


});