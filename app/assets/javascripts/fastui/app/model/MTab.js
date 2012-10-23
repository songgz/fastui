Ext.define('FastUI.model.MTab', {
    extend: 'Ext.data.Model',
    fields: ['id','title','model_class','note','help','actived','org_id','m_window_id'],
//    associations: [
//        {
//            type: 'belongsTo',
//            model: 'FastUI.model.MWindow',
//            primaryKey: 'id',
//            foreignKey: 'm_window_id',
//            autoLoad: true,
//            name:'m_window'
//        }
//    ],
    belongsTo: 'FastUI.model.MWindow',
    proxy: {
        type: 'rest',
        url : '/fastui/m_windows/:id/m_tabs',
        format: 'json'
    }
});