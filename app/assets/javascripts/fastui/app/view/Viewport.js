




Ext.define('FastUI.view.Viewport', {
    extend:'Ext.container.Viewport',
    id:'port',
    layout:'border',
    items:[
        {
            region:'north',
            html:'<h1 class="x-panel-header">Fastui Rad Framework</h1>',
            border:false,
            margins:'0 0 5 0'
        },
//        Ext.create('Ext.tree.Panel', {
//            region:'west',
//            title: 'Simple Tree',
//            width: 200,
//            height: 150,
//            store: store,
//            rootVisible: false
//        }),
        Ext.create('FastUI.view.VMenu'),
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
            id:'mycenter',
               region: 'center',
               xtype: 'tabpanel', // TabPanel itself has no title
               activeTab: 0,      // First tab active by default
               items: {
                   title: '首页',
                   html: 'The first tab\'s content. Others may be added dynamically'
               }
        }
    ]
});

