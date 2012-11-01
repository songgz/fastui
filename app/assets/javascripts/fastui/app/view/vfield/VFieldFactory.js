Ext.define('FastUI.view.vfield.VFieldFactory', {
    name:'vfieldFactory',

    constructor:function () {
        this.VType = {
            VText:"VText",
            VDate:"VDate"
        }
    },
    buildField:function(field){
        var opt = {fieldLabel:field.title,name: field.name,allowBlank: true};
        switch(field.vfield){
            case this.VType.VText:
                return Ext.create('FastUI.view.vfield.VText',opt);
                break;
            case this.VType.VDate:
                return Ext.create('FastUI.view.vfield.VDate',opt);
            break;
        }
    }
});
