/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-12
 * Time: 下午4:45
 * To change this template use File | Settings | File Templates.
 */
Ext.define('FastUI.view.mwindow.Add', {
    extend: 'Ext.window.Window',
    alias: 'widget.useradd',
    title: 'Add User',
    layout: 'fit',
    autoShow: true,
    initComponent: function () {
        this.items = [
            {
                xtype: 'form',
                bodyStyle: {
                    background: 'none',
                    padding: '10px',
                    border: '0'
                },
                items: [
                    {
                        xtype: 'textfield',
                        name: 'name',
                        allowBlank: false,
                        fieldLabel: 'Name'
                    },
                    {
                        xtype: 'textfield',
                        name: 'email',
                        allowBlank: false,
                        vtype: 'email',
                        fieldLabel: 'Email'
                    }
                ]
            }
        ];
        this.buttons = [
            {
                text: 'Save',
                action: 'save'
            },
            {
                text: 'Cancel',
                scope: this,
                handler: this.close
            }
        ];
        this.callParent(arguments);
    }
});
