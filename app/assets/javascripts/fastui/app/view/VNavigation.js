Ext.define('FastUI.view.VNavigation', {
    extend:'Ext.tree.Panel',
    region:'west',
    collapsible:true,
    title:'菜单',
    width:150,
    //scope: this,
    listeners:{
        itemclick:function (self, record, item, index, e, eOpts) {
            this.loadVWindow(self, record, item, index, e, eOpts);
        }

    },
    root:{
        text:'Root',
        expanded:true,
        children:[
            {
                text:'FastUI',
                leaf:true,
                id:1
            },
            {
                text:'Child 2',
                leaf:true
            },
            {
                text:'Child 3',
                expanded:true,
                children:[
                    {
                        text:'Grandchild',
                        leaf:true
                    }
                ]
            }
        ]
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





