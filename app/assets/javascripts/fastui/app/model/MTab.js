Ext.define('FastUI.model.MTab', {
    extend:'Ext.data.Model',

    fields:['id', 'title', 'm_window_id'],

    associations:[
        {
            type:'belongsTo',
            model:'FastUI.model.MWindow',
            name:'mwindow',
            primaryKey:'id',
            foreignKey:'m_window_id'
            //associationKey: 'parent_group' // read parent data from parent_group
        }
    ],

    proxy:{
        type:'rest',
        url:'/fastui/m_tabs',
        format:'json',
        reader:{
            type:'json',
            root:'m_tabs',
            successProperty:'success'
        }
    }

});