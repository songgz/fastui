Ext.define('Fastui.Env', {
    singleton: true,
    _ctx_: Ext.create('Fastui.Ctx'),
    getCtx: function() {
        return this._ctx_;
    },
    set:function(key,value){
        this.getCtx().set(key,value);
    },
    get:function(key){
        return this.getCtx().get(key);
    },
    setWinCtx:function(win,key,value){
        this.getCtx().set(win,key,value);
    },
    getWinCtx:function(win,key){
        return this.getCtx().get(win,key);
    },
    setTabCtx:function(win,tab,key,value){
        this.getCtx().set(win,tab,key,value);
    },
    getTabCtx:function(win,tab,key){
        return this.getCtx().set(win,tab,key);
    }
});