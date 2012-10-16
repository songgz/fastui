/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-12
 * Time: 下午4:49
 * To change this template use File | Settings | File Templates.
 */

Ext.define('FastUI.controller.MWindows', {
    extend: 'Ext.app.Controller',
    stores: [ 'MWindows'],
    models: [ 'MWindow'],
    views: [
        'mwindow.List',
        'mwindow.Edit'
//        'mwindow.Add',
//        'mwindow.Edit'
    ],
    init: function () {
        this.control({
            'viewport > panel': {
                render: this.onPanelRendered
            },
            'mwindowlist': {
                itemdblclick: this.editMWindow
//                removeitem: this.removeMWindow
            },
//            'userlist > toolbar > button[action=create]': {
//                click: this.onCreateUser
//            },
//            'useradd button[action=save]': {
//                click: this.doCreateUser
//            },
            'mwindowedit button[action=save]': {
                click: this.updateMWindow
            }
        });
    },
    onPanelRendered: function() {
        console.log('The panel was rendered');
    },
    editMWindow: function (grid, record) {
//        console.log('Double clicked on ' + record.get('name'));
        var view = Ext.widget('mwindowedit');
        view.down('form').loadRecord(record);
    },
    removeMWindow: function (user) {
//        Ext.Msg.confirm('Remove User', 'Are you sure?', function (button) {
//            if (button == 'yes') {
//                this.getUsersStore().remove(user);
//            }
//        }, this);
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
    updateMWindow: function (button) {
//        console.log('clicked the Save button');
        var win    = button.up('window'),
            form   = win.down('form'),
            record = form.getRecord(),
            values = form.getValues();

        record.set(values);
        win.close();
        this.getMWindowsStore().sync();
//        var win = button.up('window'),
//            form = win.down('form'),
//            record = form.getRecord(),
//            values = form.getValues(),
//            store = this.getUsersStore();
//        if (form.getForm().isValid()) {
//            record.set(values);
//            win.close();
//        }
    }
});
