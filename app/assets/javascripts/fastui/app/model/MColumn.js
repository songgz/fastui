Ext.define('FastUI.model.MColumn', {
    extend:'Ext.data.Model',
    fields:['title','data_index','xtype','sortable','width','m_tab_id','association','association_name'],
    associations:[
        {
            type:'belongsTo',
            model:'FastUI.model.MTab',
            name:'mtab'
        }
    ],

    proxy:{
        type:'rest',
        url:'/fastui/m_windows/:id/m_tabs/:id/m_columns',
        format:'json'
    }

});