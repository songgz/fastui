/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-12
 * Time: 下午4:16
 * To change this template use File | Settings | File Templates.
 */

Ext.define('FastUI.view.Viewport', {
    extend:'Ext.container.Viewport',

    layout:'border',
    items:[
        {
            region:'north',
            html:'<h1 class="x-panel-header">Page Title</h1>',
            border:false,
            margins:'0 0 5 0'
        },
        {
            region:'west',
            collapsible:true,
            title:'Navigation',
            width:150,
            items:[
                {
                    xtype:'button',
                    text:'My Button',
                    handler:function () {
                        alert('You clicked the button!')
                    }
                }
            ]

            // could use a TreePanel or AccordionLayout for navigational items
        },
        {
            region:'south',
            title:'South Panel',
            collapsible:true,
            html:'Information goes here',
            split:true,
            height:100,
            minHeight:100
        },
        {
            region:'east',
            title:'East Panel',
            collapsible:true,
            split:true,
            width:150
        },
        {
               region: 'center',
               xtype: 'tabpanel', // TabPanel itself has no title
               activeTab: 0,      // First tab active by default
               items: {
                   title: 'Default Tab',
                   html: 'The first tab\'s content. Others may be added dynamically'
               }
        }
    ],
    loadVWindow:function(){
        //this.id
        Ext.ModelManager.getModel('FastUI.model.MWindow').load(1, {
                    success: function(mwindow) {
                       alert(mwindow.get('title')); //outputs 123
                        var win = Ext.create('FastUI.view.VWindow',{title:mwindow.get('title')});

                        this.center().add(win);
                    }
        });


    }
});

