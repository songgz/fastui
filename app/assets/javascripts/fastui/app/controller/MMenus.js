Ext.define('FastUI.controller.MMenus', {
    extend:'Ext.app.Controller',
    stores:['MMenus'],
    //models: [ 'MWindow'],
    views:['VMenu'],
    requires:['FastUI.view.WindowMgr'],
    init:function () {
        this.control({
            'vMenu':{
                itemclick:this.loadVWindow
            }

        });
    },
    loadVWindow:function (self, record, item, index, e, eOpts) {

        var id = record.get('m_window_id');
        FastUI.view.WindowMgr.instanceWin(id, function (obj) {
            var c = Ext.getCmp('mycenter');
            var win_id = 'win_' + id;
            var win = Ext.getCmp(win_id);
            if (!win) {
                win = Ext.create('FastUI.view.VVWindow', {id:win_id,
                    vfactory:Ext.create('FastUI.view.VFactory', obj)
                });
                c.add(win);
            }
            c.setActiveTab(win);

        });
    }

});