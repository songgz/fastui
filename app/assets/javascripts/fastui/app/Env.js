Ext.define('FastUI.Env', {
    singleton: true,
    _ctx_: Ext.create('FastUI.Ctx'),
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
        this.getCtx().setWinCtx(win,key,value);
    },
    getWinCtx:function(win,key){
        return this.getCtx().getWinCtx(win,key);
    },
    setTabCtx:function(win,tab,key,value){
        this.getCtx().setTabCtx(win,tab,key,value);
    },
    getTabCtx:function(win,tab,key){
        return this.getCtx().getTabCtx(win,tab,key);
    },
    //'${value}=${value}'
    parseCtx:function(WindowNo, value){
//        var patten = /\${([\s\S]*?)}/ig ;
//        var me = this;
//        return value.replace(patten, function(m){
//            var p = patten.exec(m);
//            if(p){
//                return me.getWinCtx(WindowNo,p[1]);
//            }
//            return m;
//        });
    }

});