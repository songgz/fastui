Ext.define('FastUI.view.DataFieldFactory', {
    singleton: true,

    buildField:function(fields, field){
        switch (field.datatype) {
            case 'VTree':
                fields.push({
                    name: field.name.replace('_id', ''),
                    type: 'auto'
                });
                break;

            case 'VTable':
                fields.push({
                    name: field.name.replace('_id', ''),
                    type: 'auto'
                });
                break;

            case 'VLookup':
                fields.push({
                    name: field.name.replace('_id', ''),
                    type: 'auto'
                });
                break;

            case 'VSingleChoice':
                fields.push({
                    name: field.name.replace('_id', ''),
                    type: 'auto'
                });
                break;

            case 'VList':
                fields.push({
                    name: field.name.replace('_id', ''),
                    type: 'auto'
                });
                break;

            case 'VGroup':
                Ext.each(field.members, function(member){
                    this.buildField(fields,member);
                },this);
                break;


            default:
                if(Array.isArray(field)){
                    Ext.each(field, function(f){
                        this.buildField(fields,f);
                    },this);
                }else{
                    fields.push({
                        name: field.name,
                        type: 'auto'
                    });
                }
        }
    }
});