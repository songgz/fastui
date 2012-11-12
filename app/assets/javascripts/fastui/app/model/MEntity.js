Ext.define('FastUI.model.MEntity', {
    extend:'Ext.data.Model',
    fields:['title' ,'note' ,'name','access_level','entity_kind','actived', 'org_id', 'createdby','updatedby','help'],
    associations:[
        {
            type:'hasMany',
            model:'FastUI.model.MProperty',
            name:'mproperties',
            associationKey: 'm_properties' // read child data from child_groups
        }
    ],

    proxy:{
        type:'rest',
        url:'/fastui/m_entities',
        format:'json'
    }
});