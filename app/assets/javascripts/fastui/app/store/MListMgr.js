Ext.define('FastUI.store.MListMgr', {
    singleton:true,
    _lists_:{},
    getStore:function (list_id) {
        var gs =  this._lists_[list_id];
        if(!gs){
            gs = this.createStore(list_id);
            this._lists_[list_id] = gs;
        }
        return gs;
    },
    createStore:function (list_id) {
//        Ext.apply(Ext.data.Connection.prototype, {
//            async:false
//        });
        var store = new Ext.data.JsonStore({
            autoLoad:false,
            fields:['id', 'name', 'title'],
            proxy:{
                type:'ajax',
                url:'/fastui/m_lists/' + list_id + '/m_list_items.json',
                reader:{
                    type:'json',
                    root:''
                }
            }
        });
//        store.load();
//        Ext.apply(Ext.data.Connection.prototype, {
//            async:true
//        });
        return store;
    }
});
