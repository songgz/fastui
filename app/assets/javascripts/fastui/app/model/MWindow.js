/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-12
 * Time: 下午4:38
 * To change this template use File | Settings | File Templates.
 */
Ext.define('FastUI.model.MWindow', {
    extend: 'Ext.data.Model',
    requires: ["FastUI.model.MTab"],
    fields: ['id','title', 'note'],
//    associations: [{
//        type: 'hasMany',
//        model: 'FastUI.model.MTab',
//        primaryKey: 'id',
//        foreignKey: 'm_window_id',
//        autoLoad: true,
//        associationKey: 'm_tabs',
//        name: 'm_tabs'
//    }],
    hasMany: { model:'FastUI.model.MTab',name:'m_tabs'},
    proxy: {
        type: 'rest',
        url : '/fastui/m_windows',
        format: 'json'
    }
});