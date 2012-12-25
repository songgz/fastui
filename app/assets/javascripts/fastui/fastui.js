Ext.Loader.setConfig({
    enabled:true,
    paths:{
        'Ext':'/assets/fastui/extjs4/src',
        'Ext.ux':'/assets/fastui/extjs4/ux'
    }
});
//// Set valid ExtJS loading path (/vendor/assets/extjs4/src)
//Ext.Loader.setPath({
//    'Ext': '/assets/fastui/extjs4/src',
//    'Ext.ux': '/assets/fastui/extjs4/ux'
//});
//Ext.require('FastUI.model.MWindow');

//FastUI.model.MWindow
// create a new instance of Application class

Ext.application({
    // the global namespace
    name:'FastUI',

    appFolder:'/assets/fastui/app',
    //requires: ['FastUI.view.WindowMgr'],
    requires:['FastUI.Env'],

    //requires: ['FastUI.model.MWindow','FastUI.view.VVWindow','FastUI.view.VFactory'],
    //models: ['FastUI.model.MWindow'],
    stores:['MMenus'],
    //views: ['VMenu'],
    //controllers: [],
    controllers:['MMenus'],

    autoCreateViewport:true
//    launch: function() {
//        var store = Ext.create('Ext.data.Store', {
//            model: 'FastUI.model.MWindow'
//        });
//        store.load({
//            callback: function(records, operation, success) {
//                //the operation object contains all of the details of the load operation
//               // alert(records[1].get('title'));
//            }
//        });
//       alert(store.count()); //GET /users
//        Ext.ModelManager.getModel('FastUI.model.MWindow').load(1, {
//            success: function(user) {
//                alert(user.get('title')); //outputs 123
//            }
//        });

    // }
});