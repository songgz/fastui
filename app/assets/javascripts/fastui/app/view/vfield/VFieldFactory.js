Ext.define('FastUI.view.vfield.VFieldFactory', {
    name:'vfieldFactory',

    constructor:function () {
        this.VType = {
            VText:"VText",
            VDate:"VDate",
            VHtmlEditor:"VHtmlEditor",
            VComboBox:"VComboBox",
            VLongComboBox:"VLongComboBox",
            VTextArea:"VTextArea",
            VNumber:"VNumber",
            VCheckBox:"VCheckBox"
//            VCheckboxGroup:"VCheckboxGroup",
//            VSexSelect:"VSexSelect",
//            VByte:"VByte",
//            VYesOrNo:"VYesOrNo",
//            VFieldCombobox:"VFieldCombobox",
//            VIncludedTabsCombo:"VIncludedTabsCombo",
//            VGridColumnXtypeCombo:"VGridColumnXtypeCombo"
        }
    },
    buildField:function (field) {
        var opt = {fieldLabel:field.title, name:field.name, allowBlank:true};
        switch (field.vfield) {
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
        }
    }
});
