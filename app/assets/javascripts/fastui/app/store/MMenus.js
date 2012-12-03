Ext.define('FastUI.store.MMenus', {
    extend:'Ext.data.TreeStore',
    //storeId:'MMenuStore',
    //model:'FastUI.model.MMenus',
    autoLoad:true,

    fields:['id', {name:'text', mapping:'title'},{name:'leaf',mapping:'leaf?'},{name:'expanded',mapping:'child?'}, 'm_window_id'],
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
