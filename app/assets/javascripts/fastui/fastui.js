// Set valid ExtJS loading path (/vendor/assets/extjs4/src)
Ext.Loader.setPath('Ext', '/assets/fastui/extjs4/src');
//FastUI.model.MWindow
// create a new instance of Application class
Ext.Loader.setConfig({enabled: true});
Ext.application({
  // the global namespace
  name: 'FastUI',

  appFolder: '/assets/fastui/app',

//    models: ['FastUI.model.MWindow'],
  //controllers: [],
//    controllers: [
//        'MWindows'
//    ],

  autoCreateViewport: true
//    launch: function() {
//        var store = Ext.create('Ext.data.Store', {
//            model: 'FastUI.model.MWindow'
//        });

//        alert(store.load()); //GET /users
//        Ext.ModelManager.getModel('FastUI.model.MWindow').load(1, {
//            success: function(user) {
//                alert(user.get('title')); //outputs 123
//            }
//        });
//
//    }
});