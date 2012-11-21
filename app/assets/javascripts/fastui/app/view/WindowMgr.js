Ext.define('FastUI.view.WindowMgr', {
    singleton: true,
    _windows: {},
    load:function(id, callback){
        var me = this;
        Ext.Ajax.request({
            url: '/fastui/m_windows/'+id+'.json',
            async: false,
            success: function(response, opts) {
                var obj = Ext.decode(response.responseText);
                me._windows[id] = obj;
                callback.call(this, obj);
            },
            failure: function(response, opts) {

            }
        });
    },
    instanceWin:function(id,callback){
        var win = this._windows[id];
        if (win){
            callback.call(this, win);
        }else{
            this.load(id,callback);
        }
    }
});