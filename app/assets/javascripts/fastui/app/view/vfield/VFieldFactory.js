Ext.define('FastUI.view.vfield.VFieldFactory', {
    singleton: true,

    VType: {
        VText: 'Fastui::MText',
        VTree: 'Fastui::MTree',
        VDate: 'Fastui::MDate',
        VHtmlEditor: 'Fastui::MHtmlEditor',
        VCombobox: 'Fastui::MCombobox',
        VMultiCombobox: 'Fastui::MMultiCombobox',
        VLongCombobox: 'Fastui::MLongCombobox',
        VTextArea: 'Fastui::MTextArea',
        VNumber: 'Fastui::MNumber',
        VCheckbox: 'Fastui::MCheckbox',
        VCheckboxGroup: 'Fastui::MCheckboxGroup',
        VSexSelect: 'Fastui::MSexSelect',
        VFile: 'Fastui::MFile',
        VYesOrNo: 'Fastui::MYesOrNo',
        VGridColumnXtypeCombo: 'Fastui::MGridColumnXtypeCombo',
        VList: 'Fastui::MList',
        VLookup: 'Fastui::MRelation'
    },

    buildField: function (field, winCtx, winId, rest) {
        var dt = field.datatype;
        switch (field.datatype) {
            case 'VText':
                return Ext.create('FastUI.view.vfield.VText', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VTree':
                return Ext.create('FastUI.view.vfield.VTree', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VDate':
                return Ext.create('FastUI.view.vfield.VDate', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VHtmlEditor':
                return Ext.create('FastUI.view.vfield.VHtmlEditor', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VSingleChoice':
                return Ext.create('FastUI.view.vfield.VSingleChoice', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VMultipleChoice':
                return Ext.create('FastUI.view.vfield.VMultipleChoice', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case this.VType.VLongCombobox:
                return Ext.create('FastUI.view.vfield.VLongCombobox', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VTextArea':
                return Ext.create('FastUI.view.vfield.VTextArea', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VNumber':
                return Ext.create('FastUI.view.vfield.VNumber', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VCheckbox':
                return Ext.create('FastUI.view.vfield.VCheckbox', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VCheckboxGroup':
                return Ext.create('FastUI.view.vfield.VCheckboxGroup', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VSexSelect':
                return Ext.create('FastUI.view.vfield.VSexSelect', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VFile':
                return Ext.create('FastUI.view.vfield.VFile', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VYesOrNo':
                return Ext.create('FastUI.view.vfield.VYesOrNo', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VList':
                return Ext.create('FastUI.view.vfield.VCombobox', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
            case 'VLookup':
                return Ext.create('FastUI.view.vfield.VLookup', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});
                break;
        }
    }
});
