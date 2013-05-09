Ext.apply(Ext.form.field.VTypes,{
  uniquename: function (v) {
        return Ext.form.field.VTypes.uniquenameRegex.test(v);
    },
    uniquenameRegex: /^[a-z]{1}[a-z_0-9]*$/,
    uniquenameText: 'Invalid unique name'
});