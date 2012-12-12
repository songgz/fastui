Ext.define('Fastui.Ctx', {
    constructor:function(){
        this._data_ = {};
    },
    set:function(key,value){
        this._data_[key] = value;
    },
    get:function(key){
        return this._data_[key];
    },
    setWinCtx:function(win,key,value){
        this.set(win + '|' + key, value);
    },
    getWinCtx:function(win,key){
        return this.get(win + '|' + key);
    },
    setTabCtx:function(win,tab,key,value){
        this.set(win + '|' +  tab + '|' + key, value);
    },
    getTabCtx:function(win,tab,key){
        return this.get(win + '|' +  tab + '|' + key);
    }

});