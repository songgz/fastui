/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-12
 * Time: 下午4:49
 * To change this template use File | Settings | File Templates.
 */
Ext.define('FastUI.controller.MWindows', {
    extend: 'Ext.app.Controller',
    stores: [
        'MWindow'
    ],
    models: [
        'MWindow'
    ],
    views: [
        'mwindow.List',
        'mwindow.Add',
        'mwindow.Edit'
    ],
    init: function () {
        this.control({
            'userlist': {
                itemdblclick: this.editUser,
                removeitem: this.removeUser
            },
            'userlist > toolbar > button[action=create]': {
                click: this.onCreateUser
            },
            'useradd button[action=save]': {
                click: this.doCreateUser
            },
            'useredit button[action=save]': {
                click: this.updateUser
            }
        });
    },
    editUser: function (grid, record) {
        var view = Ext.widget('useredit');
        view.down('form').loadRecord(record);
    },
    removeUser: function (user) {
        Ext.Msg.confirm('Remove User', 'Are you sure?', function (button) {
            if (button == 'yes') {
                this.getUsersStore().remove(user);
            }
        }, this);
    },
    onCreateUser: function () {
        var view = Ext.widget('useradd');
    },
    doCreateUser: function (button) {
        var win = button.up('window'),
            form = win.down('form'),
            values = form.getValues(),
            store = this.getUsersStore();
        if (form.getForm().isValid()) {
            store.add(values);
            win.close();
        }
    },
    updateUser: function (button) {
        var win = button.up('window'),
            form = win.down('form'),
            record = form.getRecord(),
            values = form.getValues(),
            store = this.getUsersStore();
        if (form.getForm().isValid()) {
            record.set(values);
            win.close();
        }
    }
});

