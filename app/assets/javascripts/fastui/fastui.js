// Set valid ExtJS loading path (/vendor/assets/extjs4/src)
Ext.Loader.setPath('Ext', '/assets/fastui/extjs4/src');

// create a new instance of Application class
Ext.application({
  // the global namespace
  name: 'FastUI',

  appFolder: '/assets/fastui/app',

  //controllers: [],

  autoCreateViewport: true
});