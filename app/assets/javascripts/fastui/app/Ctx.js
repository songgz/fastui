Ext.define('FastUI.Ctx', {
    constructor:function(){
        this._data_ = {};
    },
    set:function(key,value){
        this._data_[key] = value;
    },
    get:function(key){
        return this._data_[key];
    },
    setWinCtx:function(winNo,key,value){
        this.set(winNo + '|' + key, value);
    },
    getWinCtx:function(winNo,key){
        return this.get(winNo + '|' + key);
    },
    setTabCtx:function(winNo,tabNo,key,value){
        this.set(winNo + '|' +  tabNo + '|' + key, value);
    },
    getTabCtx:function(winNo,tabNo,key){
        return this.get(winNo + '|' +  tabNo + '|' + key);
    },
    parseCtx:function(WinNo, value){
        var patten = /\${([\s\S]*?)}/ig ;
        var me = this;
        return value.replace(patten, function(m){
            m = m.replace('${','');
            m = m.replace('}','');
            return me.getWinCtx(WinNo,m);
        });
    }

});