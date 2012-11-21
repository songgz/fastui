Ext.define('FastUI.view.VNavigation', {
    extend:'Ext.tree.Panel',
    region:'west',
    collapsible:true,
    title:'菜单',
    width:150,
    //scope: this,
    initComponent:function () {
        this.store = this.getStore();
        this.callParent();
    },
    listeners:{
        itemclick:function (self, record, item, index, e, eOpts) {
            this.loadVWindow(self, record, item, index, e, eOpts);
        }

    },

    loadVWindow:function (self, record, item, index, e, eOpts) {
        var id = record.get('m_window_id');
        FastUI.view.WindowMgr.instanceWin(id, function(obj){
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

//        Ext.Ajax.request({
//            url:'/fastui/' + 'm_windows/' + id + '.json',
//            params:{
//            },
//            success:function (response) {
//                var c = Ext.getCmp('mycenter');
//                var win_id = 'win_' + id;
//                var win = Ext.getCmp(win_id);
//                if (!win) {
//                    win = Ext.create('FastUI.view.VVWindow', {id:win_id,
//                        vfactory:Ext.create('FastUI.view.VFactory', Ext.JSON.decode(response.responseText))
//                    });
//                    c.add(win);
//                }
//                c.setActiveTab(win);
//            }
//        });
    },
    getStore:function () {
        return Ext.create('Ext.data.TreeStore', {
            // convert:function(v,rec){return rec.getRawValue().title}
            fields:['id', {name:'text', mapping:'title'}, 'm_window_id'],
            proxy:{
                type:'ajax',
                url:'/fastui/m_menu_items.json',
                reader:{
                    type:'json',
                    root:'',
                    record:''
                }
            },
            root:{
                text:'菜单',

                expanded:true
            }
        });
    }



//
//        var w = Ext.create('FastUI.view.VFactory','m_windows/1.json');
//        w.getTitle();

//        Ext.ModelManager.getModel('FastUI.model.MWindow').load(1, {
//            success:function (mwindow) {
//                var win = Ext.create('FastUI.view.VWindow', {mwindow:mwindow,title:mwindow.get('title')});
//                var c = Ext.getCmp('mycenter');
//                c.add(win);
//                c.setActiveTab(win);
//            },
//            failure:function(){
//               alert('failure');
//            }
//        });



});





