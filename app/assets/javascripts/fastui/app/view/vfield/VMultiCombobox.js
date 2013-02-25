Ext.define('FastUI.view.vfield.VMultiCombobox', {
    extend:'Ext.form.field.ComboBox',
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    valueField:'id',
    displayField:"title",
    forceSelection:true,
    multiSelect: true,
    triggerAction:'all',
    editable:false,
    selectOnFocus:true,

    initComponent:function () {
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('m_property').name + '][]';
        this.disabled = this.getFValue('is_readonly');
        this.allowBlank = true;
        this.store = this.getStore();
        this.callParent();
    },
    getStore:function () {
        var rest = Ext.create('FastUI.view.Rest', this.getMEntity().name);
        return new Ext.data.JsonStore({
            autoLoad:{start:0, limit:2},
            fields:['id', 'title'],
            proxy:{
                type:'ajax',
                url:rest.indexPath(),
                reader:{
                    type:'json',
                    root:'rows',
                    totalProperty:"totalCount"
                }
            }
        });
    },
    getMEntity:function(){
        return this.valueObject.m_property.m_datatype.m_entity;
    },
    getFValue:function (key) {
        return this.valueObject[key];
    }
    ,
    setValue:function (value) {
        if(value && value.name && value.title){
            this.setValue(value.name);
        }else{
//            if(value){
//                alert(typeof(value));
//            }
            this.callParent(arguments);
        }
    }

});