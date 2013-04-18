Ext.define('FastUI.store.MWindowMgr', {
    singleton: true,
    _windows_: {},
    request:function(id, callback){
        var me = this;
        Ext.Ajax.request({
            url: '/fastui/m_views/'+id+'.json',
            //async: true,
            success: function(response, opts) {
                var obj = Ext.decode(response.responseText);
                me._windows_[id] = obj;
                callback.call(this, obj);
            },
            failure: function(response, opts) {

            }
        });
    },
    load:function(id,callback){
        var win = this._windows_[id];
        if (win){
            callback.call(this, win);
        }else{
            this.request(id,callback);
        }
    }
});