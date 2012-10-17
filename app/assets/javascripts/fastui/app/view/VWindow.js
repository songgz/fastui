/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-16
 * Time: 下午4:24
 * To change this template use File | Settings | File Templates.
 */


Ext.define('FastUI.view.VWindow', {
    extend: 'Ext.TabPanel',
    alias: 'widget.vwindow',
    title: 'The VWindow',
    region: 'center',
    store: 'MWindows',
    initComponent: function () {
        Ext.create('FastUI.store.MWindows', {
            model: 'MWindow'
        });
//        this.columns = [
//            {header: 'Name',  dataIndex: 'name',  flex: 1},
//            {header: 'Email', dataIndex: 'email', flex: 1}
//        ];
//        this.callParent(arguments);
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
    }
});

