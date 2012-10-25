Ext.define('FastUI.model.MTab', {
    extend:'Ext.data.Model',
    requires:['FastUI.model.MField','FastUI.model.MColumn'],
    fields:['id', 'title', 'm_window_id','model_class','note','help','actived','org_id','createdby','updatedby'],
    associations:[
        {
            type:'belongsTo',
            model:'FastUI.model.MWindow',
            name:'mwindow'
//            primaryKey:'id',
//            foreignKey:'m_window_id'
            //associationKey: 'parent_group' // read parent data from parent_group
        },
        {
            type: 'hasMany',
            model: 'FastUI.model.MField',
            name: 'mfields',
            associationKey: 'm_fields'
        },
        {
            type: 'hasMany',
            model: 'FastUI.model.MColumn',
            name: 'mcolumns',
            associationKey: 'm_columns'
        }
    ],

    proxy:{
        type:'rest',
        url:'/fastui/m_windows/:id/m_tabs',
        format:'json'
//        reader:{
//            type:'json',
//            root:'m_tabs',
//            successProperty:'success'
//        }
    }

});