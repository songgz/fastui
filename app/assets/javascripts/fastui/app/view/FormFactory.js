Ext.define('FastUI.view.FormFactory', {
    singleton: true,

    createForm: function (form_kind, tab) {
        if (form_kind == '') {
            return Ext.create('FastUI.view.VForm', {tab: tab});
        } else {
            return Ext.create('FastUI.view.' + this.form_kind, {tab: tab});
        }
    }
});