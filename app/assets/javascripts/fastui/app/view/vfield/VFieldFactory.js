Ext.define('FastUI.view.vfield.VFieldFactory', {
    singleton: true,

     VType:{
            VText:'Fastui::MText',
            VDate:'Fastui::MDate',
            VHtmlEditor:'Fastui::MHtmlEditor',
            VComboBox:'Fastui::MComboBox',
            VLongComboBox:'Fastui::MLongComboBox',
            VTextArea:'Fastui::MTextArea',
            VNumber:'Fastui::MNumber',
            VCheckBox:'Fastui::MCheckBox',
            VCheckboxGroup:'Fastui::MCheckboxGroup',
            VSexSelect:'Fastui::MSexSelect',
            VFile:'Fastui::MFile',
            VYesOrNo:'Fastui::MYesOrNo',
            VGridColumnXtypeCombo:'Fastui::MGridColumnXtypeCombo',
            VList:'Fastui::MList',
            VLookup:'Fastui::MRelation'
        },

    buildField:function (field,winCtx,winId,rest) {
        var dt = field.m_property.m_datatype;
        switch (dt.class_name) {
            case this.VType.VText:
                return Ext.create('FastUI.view.vfield.VText', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VDate:
                return Ext.create('FastUI.view.vfield.VDate', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VHtmlEditor:
                return Ext.create('FastUI.view.vfield.VHtmlEditor', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VComboBox:
                return Ext.create('FastUI.view.vfield.VComboBox', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VLongComboBox:
                return Ext.create('FastUI.view.vfield.VLongComboBox', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VTextArea:
                return Ext.create('FastUI.view.vfield.VTextArea', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VNumber:
                return Ext.create('FastUI.view.vfield.VNumber', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VCheckBox:
                return Ext.create('FastUI.view.vfield.VCheckBox', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VCheckboxGroup:
                return Ext.create('FastUI.view.vfield.VCheckboxGroup', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VSexSelect:
                return Ext.create('FastUI.view.vfield.VSexSelect', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VFile:
                return Ext.create('FastUI.view.vfield.VFile', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VYesOrNo:
                return Ext.create('FastUI.view.vfield.VYesOrNo', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VList:
                return Ext.create('FastUI.view.vfield.VComboBox', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
            case this.VType.VLookup:
                return Ext.create('FastUI.view.vfield.VLookUpWindow', {valueObject:field,winCtx:winCtx,winId:winId,rest:rest});
                break;
        }
    }
});
