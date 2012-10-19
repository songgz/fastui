/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-12
 * Time: 下午4:40
 * To change this template use File | Settings | File Templates.
 */

Ext.define('FastUI.store.MTabs', {
    extend:'Ext.data.Store',
    model:'FastUI.model.MTab',
    autoLoad:true,
    proxy:{
        type:'ajax',
        api:{
//            create: '/fastui/mtabs/new',
            read: '/fastui/mwindows/:id/mtabs'
//            update: '/fastui/mtabs/',
//            destroy: '/fastui/mtabs/delete'
        },
        reader:{
            type:'json',
            root:'mtabs',
            successProperty:'success'
        }
    }
});
