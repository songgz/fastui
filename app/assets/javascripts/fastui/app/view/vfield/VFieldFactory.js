Ext.define('FastUI.view.vfield.VFieldFactory', {
    name:'vfieldFactory',
//        singleton: true,
    constructor:function () {
        this.VType = {
            VText:"Fastui::MText",
            VDate:"Fastui::MDate",
            VHtmlEditor:"Fastui::MHtmlEditor",
            VComboBox:"Fastui::MComboBox",
            VLongComboBox:"Fastui::MLongComboBox",
            VTextArea:"Fastui::MTextArea",
            VNumber:"Fastui::MNumber",
            VCheckBox:"Fastui::MCheckBox",
            VCheckboxGroup:"Fastui::MCheckboxGroup",
            VSexSelect:"Fastui::MSexSelect",
            VFile:"Fastui::MFile",
            VYesOrNo:"Fastui::MYesOrNo",
            VGridColumnXtypeCombo:"Fastui::MGridColumnXtypeCombo",
            VList:'Fastui::MList',
            VLookup:'Fastui::MRelation'
        }
    },
    buildField:function (field) {
        var opt = {fieldLabel:field.title, name:field.name, disabled:(field.read && field.read.name == 'true'), allowBlank:true};
        var dt = field.m_property.m_datatype;
        switch (dt.class_name) {
            case this.VType.VText:
                return Ext.create('FastUI.view.vfield.VText', opt);
                break;
            case this.VType.VDate:
                return Ext.create('FastUI.view.vfield.VDate', opt);
                break;
            case this.VType.VHtmlEditor:
                return Ext.create('FastUI.view.vfield.VHtmlEditor', opt);
                break;
            case this.VType.VComboBox:
                return Ext.create('FastUI.view.vfield.VComboBox', opt);
                break;
            case this.VType.VLongComboBox:
                return Ext.create('FastUI.view.vfield.VLongComboBox', opt);
                break;
            case this.VType.VTextArea:
                return Ext.create('FastUI.view.vfield.VTextArea', opt);
                break;
            case this.VType.VNumber:
                return Ext.create('FastUI.view.vfield.VNumber', opt);
                break;
            case this.VType.VCheckBox:
                return Ext.create('FastUI.view.vfield.VCheckBox', opt);
                break;
            case this.VType.VCheckboxGroup:
                return Ext.create('FastUI.view.vfield.VCheckboxGroup', opt);
                break;
            case this.VType.VSexSelect:
                return Ext.create('FastUI.view.vfield.VSexSelect', opt);
                break;
            case this.VType.VFile:
                return Ext.create('FastUI.view.vfield.VFile', opt);
                break;
            case this.VType.VYesOrNo:
                return Ext.create('FastUI.view.vfield.VYesOrNo', opt);
                break;
            case this.VType.VList:
                opt['list_id'] = dt.id;
                return Ext.create('FastUI.view.vfield.VComboBox', opt);
                break;
            case this.VType.VLookup:
                opt['entity'] = dt.m_entity;
                return Ext.create('FastUI.view.vfield.VLookUpWindow', opt);
                break;
        }
    }
});
