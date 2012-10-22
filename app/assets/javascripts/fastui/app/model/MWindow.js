/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-12
 * Time: 下午4:38
 * To change this template use File | Settings | File Templates.
 */
Ext.define('FastUI.model.MWindow', {
    extend: 'Ext.data.Model',
    fields: ['title', 'note'],
    hasMany: { model:'FastUI.model.MTab',name:'m_tabs'},
    proxy: {
        type: 'rest',
        url : '/fastui/m_windows',
        format: 'json'
    }
});