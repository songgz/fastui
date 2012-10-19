Ext.define('FastUI.view.VNavigation', {
    extend:'Ext.tree.Panel',
    region:'west',
    collapsible:true,
    title:'菜单',
    width:150,
    listeners:{
        itemclick:function (self, record, item, index, e, eOpts) {
            Ext.ModelManager.getModel('FastUI.model.MWindow').load(1, {
                success:function (mwindow) {
                    //alert(mwindow.get('title')); //outputs 123

                    var win = Ext.create('FastUI.view.VWindow',{mwindow:mwindow,title:mwindow.get('title')});
                    //var win = Ext.create('Ext.Panel', {title:'myss'});
                    var c = Ext.getCmp('mycenter');
                    c.add(win);
                    c.setActiveTab(win);

                }
            })
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
        //this.id
        var self = this;
        alert(self);
        Ext.ModelManager.getModel('FastUI.model.MWindow').load(1, {
            success:function (mwindow) {
                //alert(mwindow.get('title')); //outputs 123

                //var win = Ext.create('FastUI.view.VWindow',{title:mwindow.get('title')});
                var win = Ext.create('Ext.Panel', {title:'myss'});
                var c = self.center()
                c.add(win);
                c.show();
            }
        });


    }


});





