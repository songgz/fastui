Ext.define('FastUI.model.MField', {
    extend:'Ext.data.Model',
    fields:['title','m_tab_id','m_attr','vfield','note','help','actived','org_id','createdby','updatedby'],
    associations:[
        {
            type:'belongsTo',
            model:'FastUI.model.MTab',
            name:'mtab'
        }
    ],

    proxy:{
        type:'rest',
        url:'/fastui/m_windows/:id/m_tabs/:id/m_fields',
        format:'json'
    }

});