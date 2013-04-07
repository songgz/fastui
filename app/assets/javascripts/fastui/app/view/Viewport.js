Ext.define('FastUI.view.Viewport', {
    extend:'Ext.container.Viewport',
    id:'port',
    layout:'border',
    items:[
        {
            height:43,
            html:"<div class=\'fastui-header\'><span class=\'caption\'>Fastui Rapid Development Framework</span><span class=\'version\'>(version 0.5 built on ExtJS 4.2.0)</span></div>",
            region:"north",
            split:true,
            xtype:"container"
        },
        /*{
            region:'north',
            html:'<h1 class="x-panel-header">Fastui Rad Framework</h1>',
            border:false,
            margins:'0 0 5 0'
        },*/
//        Ext.create('Ext.tree.Panel', {
//            region:'west',
//            title: 'Simple Tree',
//            width: 200,
//            height: 150,
//            store: store,
//            rootVisible: false
//        }),
        {
            region:"west",
            activeTab:0,
            collapseMode:"mini",
            collapsible:true,
            split:true,
            width:295,
            defaults:{border:false},
            items:[Ext.create('FastUI.view.VMenu'),{title:'帮助',iconCls:'fastui-btn-help'}],
            xtype:"tabpanel"
        },
        //Ext.create('FastUI.view.VMenu'),
//        {
//            region:'south',
//            title:'South Panel',
//            collapsible:true,
//            html:'Information goes here',
//            split:true,
//            height:100,
//            minHeight:100
//        },
        {
            region:"south",
            border:false,
            height:28,
            items:[{xtype:"tbfill"},{style:"font-weight:bold",text:"Copyright 2012-2013 春腾科技.",xtype:"tbtext"}],
            xtype:"toolbar"
        },
//        {
//            region:'east',
//            title:'East Panel',
//            collapsible:true,
//            split:true,
//            width:150
//        },
        {
            id:'mycenter',
               region: 'center',
               xtype: 'tabpanel', // TabPanel itself has no title
               activeTab: 0,      // First tab active by default

               items: [{
                   title: '首页',
                   iconCls:'fastui-home',
                   border:false,

                   html: 'The first tab\'s content. Others may be added dynamically'
               }]
        }
    ]
});

