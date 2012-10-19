Ext.define('FastUI.model.MTab', {
    extend: 'Ext.data.Model',
    fields: ['title','model_class','note','help','actived','org_id'],
    belongsTo :'FastUI.model.MWindow'
});