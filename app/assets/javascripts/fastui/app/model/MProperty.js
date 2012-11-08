Ext.define('FastUI.model.MProperty', {
    extend:'Ext.data.Model',
    fields:['m_entity','title' ,'note' ,'name','refable','entity_kind','actived', 'org_id', 'createdby','updatedby','help'],
    associations:[
        {
            type:'belongsTo',
            model:'FastUI.model.MEntity',
            name:'mentity'
        }
    ],

    proxy:{
        type:'rest',
        url:'/fastui/m_properties',
        format:'json'
    }
});