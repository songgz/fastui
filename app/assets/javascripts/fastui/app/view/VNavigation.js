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
                text:'Child 1',
                leaf:true
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
        Ext.ModelManager.getModel('FastUI.model.MWindow').load(2, {
            success:function (mwindow) {
                //alert(mwindow.mtabs().first());
                var win = Ext.create('FastUI.view.VWindow', {mwindow:mwindow,title:mwindow.get('title')});

                var c = Ext.getCmp('mycenter');
                c.add(win);
                c.setActiveTab(win);
            }
        });
    }


});





