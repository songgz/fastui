Ext.define('FastUI.model.MWindow', {
    extend:'Ext.data.Model',

    requires:['FastUI.model.MTab'],

    fields:['id', 'title', 'note'],

    associations:[
        {
            type:'hasMany',
            model:'FastUI.model.MTab',
            name:'mtabs',
            primaryKey:'id',
            foreignKey:'m_window_id',
            autoLoad:true
            //associationKey: 'child_groups' // read child data from child_groups
        }
    ],

    proxy:{
        type:'rest',
        url:'/fastui/m_windows',
        format:'json',
        reader:{
            type:'json',
            root:'m_windows',
            successProperty:'success'
        }
    }
});