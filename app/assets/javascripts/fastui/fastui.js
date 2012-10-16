// Set valid ExtJS loading path (/vendor/assets/extjs4/src)
Ext.Loader.setPath('Ext', '/assets/fastui/extjs4/src');

// create a new instance of Application class
Ext.application({
  // the global namespace
  name: 'FastUI',

  appFolder: '/assets/fastui/app',

  //controllers: [],
    controllers: [
        'MWindows'
    ],
  autoCreateViewport: true
//    launch: function() {
//        Ext.create('Ext.container.Viewport', {
//            layout: 'fit',
//            items: [
//                {
////                    xtype: 'panel',
////                    title: 'Users',
////                    html : 'List of users will go here'
//                    xtype: 'mwindowlist'
//                }
//            ]
//        });
//    }
});