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
        field.datatype = field.datatype || '';
        switch (field.datatype) {
            case 'VText':
                return Ext.create('FastUI.view.vfield.VText', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VTree':
                return Ext.create('FastUI.view.vfield.VTree', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VDate':
                return Ext.create('FastUI.view.vfield.VDate', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VHtmlEditor':
                return Ext.create('FastUI.view.vfield.VHtmlEditor', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VSingleChoice':
                return Ext.create('FastUI.view.vfield.VSingleChoice', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VMultipleChoice':
                return Ext.create('FastUI.view.vfield.VMultipleChoice', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case this.VType.VLongCombobox:
                return Ext.create('FastUI.view.vfield.VLongCombobox', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VTextArea':
                return Ext.create('FastUI.view.vfield.VTextArea', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VNumber':
                return Ext.create('FastUI.view.vfield.VNumber', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VCheckbox':
                return Ext.create('FastUI.view.vfield.VCheckbox', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VCheckboxGroup':
                return Ext.create('FastUI.view.vfield.VCheckboxGroup', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VSexSelect':
                return Ext.create('FastUI.view.vfield.VSexSelect', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VFile':
                return Ext.create('FastUI.view.vfield.VFile', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VYesOrNo':
                return Ext.create('FastUI.view.vfield.VYesOrNo', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VList':
                return Ext.create('FastUI.view.vfield.VCombobox', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VLookup':
                return Ext.create('FastUI.view.vfield.VLookup', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VGroup':
                var box = Ext.create('Ext.form.FieldSet',{
                    title: field.title,
                    collapsible: true,
                    defaults: {
                        labelWidth: 89,
                        layout: {
                            type: 'hbox',
                            defaultMargins: {top: 0, right: 0, bottom: 5, left: 0}
                        }
                    },
                    defaultType: 'textfield'
                });
                Ext.each(field.members, function(member){
                    box.add(this.buildField(member, winCtx, winId, rest));
                },this);
                return box;

            default:
                if(Array.isArray(field)){
                    var line = Ext.create('Ext.container.Container', {
                        layout: 'hbox',
                        margin: '0 0 5 0',
                        defaultType: 'textfield'
                    });
                    Ext.each(field, function(f){
                        line.add(this.buildField(f, winCtx, winId, rest));
                    },this);
                    return line;
                }

        }
    }
});
