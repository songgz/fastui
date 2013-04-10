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
        {
            region:"south",
            border:false,
            height:28,
            items:[{xtype:"tbfill"},{style:"font-weight:bold",text:"Copyright 2012-2013 .",xtype:"tbtext"}],
            xtype:"toolbar"
        },
        {
            id:'mycenter',
               region: 'center',
               xtype: 'tabpanel', // TabPanel itself has no title
               activeTab: 0,      // First tab active by default
            //maskOnDisable: false,

               items: [{
                   title: '首页',
                   iconCls:'fastui-home',
                   border:false,

                   html: 'The first tab\'s content. Others may be added dynamically'
               }]
        }
    ],
    listeners: {
        afterrender: function() {
            var mask = Ext.get('fastui-loading');
            mask.fadeOut({callback: function(){ mask.destroy(); }});
        }
    }
});

