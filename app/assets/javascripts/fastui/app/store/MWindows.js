Ext.define('FastUI.store.MWindows', {
    extend:'Ext.data.JsonStore',
    storeId:'MWindowStore',
    proxy:{
        type:'ajax',
        url:'get-images.php',
        reader:{
            type:'json',
            root:'',
            idProperty:'id'
        }
    },

    //alternatively, a Ext.data.Model name can be given (see Ext.data.Store for an example)
    fields:['name', 'url', {name:'size', type:'float'}, {name:'lastmod', type:'date'}]

//    model:'FastUI.model.MWindow'
//    autoLoad:true,
//    autoSync: true,
//    proxy:{
//        type:'ajax',
//        api:{
////            read:'/assets/fastui/data/mwindows.json',
////            update:'/assets/fastui/data/updateMWindows.json'
//            create: '/fastui/m_windows/new',
//            read: '/fastui/m_windows',
//            update: '/fastui/m_windows/',
//            destroy: '/fastui/m_windows/delete'
//        },
//        reader:{
//            type:'json',
//            root:'m_windows',
//            successProperty:'success'
//        }
//        type: 'ajax',
//        limitParam: 'size',
//        startParam: undefined,
//        api: {
//            create: '/fastui/mwindows/new',
//            read: '/fastui/mwindows',
//            update: '/fastui/mwindows/',
//            destroy: '/fastui/mwindows/delete'
//        },
//        reader: {
//            type: 'json',
//            root: 'data',
//            successProperty: 'success'
//        },
//        writer: {
//            type: 'json',
//            writeAllFields: false
//        }
//    }
});
