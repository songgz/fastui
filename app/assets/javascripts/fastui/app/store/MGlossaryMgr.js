Ext.define('FastUI.store.MGlossaryMgr', {
    singleton:true,
    _glossaries_:{},
    getStore:function (glossary_id) {
        var gs =  this._glossaries_[glossary_id];
        if(!gs){
            gs = this.createStore(glossary_id);
            this._glossaries_[glossary_id] = gs;
        }
        return gs;
    },
    createStore:function (glossary_id) {
        return new Ext.data.JsonStore({
            //autoLoad:true,
            fields:['id', 'name', 'title'],
            proxy:{
                type:'ajax',
                url:'/fastui/m_glossaries/' + glossary_id + '/m_glossary_items.json',
                reader:{
                    type:'json',
                    root:''
                }
            }
        });
    }
});