/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-12
 * Time: 下午4:40
 * To change this template use File | Settings | File Templates.
 */

Ext.define('FastUI.store.MWindows', {
    extend:'Ext.data.Store',
    model:'FastUI.model.MWindow',
//    fields: ['name', 'email'],
//    data: [
//        {name: 'Ed',    email: 'ed@sencha.com'},
//        {name: 'Tommy', email: 'tommy@sencha.com'}
//    ]
    autoLoad:true,
//    autoSync: true,
    proxy:{
        type:'ajax',
        api:{
            read:'/assets/fastui/data/mwindows.json',
            update:'/assets/fastui/data/updateMWindows.json'
        },
        reader:{
            type:'json',
            root:'mwindows',
            successProperty:'success'
        }
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
    }
});
