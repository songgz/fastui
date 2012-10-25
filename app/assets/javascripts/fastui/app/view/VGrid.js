Ext.create('Ext.data.Store', {
    storeId:'simpsonsStore',
    fields:['name', 'email', 'phone'],
    data:{'items':[
        { 'name': 'Lisa',  "email":"lisa@simpsons.com",  "phone":"555-111-1224"  },
        { 'name': 'Bart',  "email":"bart@simpsons.com",  "phone":"555-222-1234" },
        { 'name': 'Homer', "email":"home@simpsons.com",  "phone":"555-222-1244"  },
        { 'name': 'Marge', "email":"marge@simpsons.com", "phone":"555-222-1254"  }
    ]},
    proxy: {
        type: 'memory',
        reader: {
            type: 'json',
            root: 'items'
        }
    }
});

//Ext.define('FastUI.view.VGrid', {
//    extend: 'Ext.grid.Panel',
//    title: 'Simpsons',
//    store: Ext.data.StoreManager.lookup('simpsonsStore'),
//    columns: [
//        { header: 'Name',  dataIndex: 'name' },
//        { header: 'Email', dataIndex: 'email', flex: 1 },
//        { header: 'Phone', dataIndex: 'phone' }
//    ],
//    height: 200,
//    width: 400
//});
//Ext.create('Ext.data.Store', {
//    storeId:'mwindowStore',
//    model: "FastUI.model.MWindow"
//});

Ext.define('FastUI.view.VGrid', {
    extend: 'Ext.grid.Panel',
//    store: Ext.data.StoreManager.lookup('simpsonsStore'),
//    store: Ext.data.StoreManager.lookup('mwindowStore'),
    columns: [
        { header: 'Name',  dataIndex: 'id' },
        { header: 'Email', dataIndex: 'title' },
        { header: 'Phone', dataIndex: 'note' }
    ],
    initComponent:function(){
//        alert(this.store.count());
        this.store = this.gridStore();
        this.callParent();

    },
    gridStore:function(){
//        alert(this.mtab.get('title'));
       var gStore = Ext.create('Ext.data.Store', {
            model: 'FastUI.model.MWindow',
           autoLoad: true
        });
        return gStore;

    },
    gridColumns:function(){

    }
});