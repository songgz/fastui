/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-12
 * Time: 下午4:48
 * To change this template use File | Settings | File Templates.
 */
Ext.define('FastUI.view.mwindow.List', {
    extend: 'Ext.grid.Panel',
//    alias: 'widget.userlist',
    alias: 'widget.mwindowlist',
//    title: 'All Users',
    title: 'All MWindows',
//    store: 'Users',
    store: 'MWindows',
    initComponent: function () {
//        this.store = {
//            fields: ['name', 'email'],
//            data  : [
//                {name: 'Ed',    email: 'ed@sencha.com'},
//                {name: 'Tommy', email: 'tommy@sencha.com'}
//            ]
//        };

        this.columns = [
            {header: 'Name',  dataIndex: 'name',  flex: 1},
            {header: 'Email', dataIndex: 'email', flex: 1}
        ];

        this.callParent(arguments);
//        this.tbar = [{
//            text: 'Create User', action: 'create'
//        }];
//        this.columns = [
//            { header: 'Id', dataIndex: 'id', width: 50 },
//            { header: 'Name', dataIndex: 'name', flex: 1 },
//            { header: 'Email', dataIndex: 'email', flex: 1 }
//        ];
//        this.addEvents('removeitem');
//        this.actions = {
//            removeitem: Ext.create('Ext.Action', {
//                text: 'Remove User',
//                handler: function () { this.fireEvent('removeitem', this.getSelected()) },
//                scope: this
//            })
//        };
//        var contextMenu = Ext.create('Ext.menu.Menu', {
//            items: [
//                this.actions.removeitem
//            ]
//        });
//        this.on({
//            itemcontextmenu: function (view, rec, node, index, e) {
//                e.stopEvent();
//                contextMenu.showAt(e.getXY());
//                return false;
//            }
//        });
//        this.callParent(arguments);
    },
    getSelected: function () {
        var sm = this.getSelectionModel();
        var rs = sm.getSelection();
        if (rs.length) {
            return rs[0];
        }
        return null;
    }
});

