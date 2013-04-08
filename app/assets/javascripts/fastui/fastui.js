 Ext.Loader.setConfig({
    enabled:true,
    paths:{
        'Ext.ux':'/assets/fastui/extjs4/ux'
    }
});

Ext.application({
    // the global namespace
    name:'FastUI',
    appFolder:'/assets/fastui/app',
    requires:['FastUI.Env'],

    autoCreateViewport:true,
    launch: function() {
//        var win;
//        if(!win){
//            win = Ext.create('FastUI.view.VLoginWindow').show();
//        }
    }
});