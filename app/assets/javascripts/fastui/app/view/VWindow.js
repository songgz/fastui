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
    models: ['FastUI.model.MWindow'],
//    store: 'MWindows',
    initComponent: function () {
//        Ext.ModelManager.getModel('FastUI.model.MWindow').load(1, {
//            success: function(user) {
//                alert(user.get('title')); //outputs 123
//            }
//        });
//        this.m_windows = Ext.create('FastUI.store.MWindows', {
//            model: 'MWindow'
//        });
//        this.m_windows.load({
//            scope   : this,
//            callback: function(records,operation, success) {
//                //the operation object contains all of the details of the load operation
////                console.log(records);
//                alert(records);
//            }
//        });
//        this.columns = [
//            {header: '标题',  dataIndex: 'title',  flex: 1},
//            {header: '描述', dataIndex: 'note', flex: 1}
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

