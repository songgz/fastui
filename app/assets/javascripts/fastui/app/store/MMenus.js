Ext.define('FastUI.store.MMenus', {
    extend:'Ext.data.TreeStore',
    //storeId:'MMenuStore',
    //model:'FastUI.model.MMenus',
    autoLoad:true,

    fields:['id', {name:'text', mapping:'title'}, 'm_window_id'],
    proxy:{
        type:'ajax',
        url:'/fastui/m_menu_items.json',
        reader:{
            type:'json',
            root:'',
            record:''
            //successProperty:'success'
        }
    },
    root:{
        text:'菜单',

        expanded:true
    }

});
