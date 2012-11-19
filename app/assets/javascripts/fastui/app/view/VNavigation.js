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

        Ext.Ajax.request({
            url:'/fastui/' + 'm_windows/1.json',
            params:{
            },
            success:function (response) {
                var win = Ext.create('FastUI.view.VVWindow', {
                    vfactory:Ext.create('FastUI.view.VFactory', Ext.JSON.decode(response.responseText))
                });
                var c = Ext.getCmp('mycenter');
                c.add(win);
                c.setActiveTab(win);
            }
        });
    },
    getStore:function () {
        return Ext.create('Ext.data.TreeStore', {
            // convert:function(v,rec){return rec.getRawValue().title}
            fields:['id', {name:'text', mapping:'title'}],
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





