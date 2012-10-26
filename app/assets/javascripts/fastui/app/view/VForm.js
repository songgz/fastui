Ext.define('FastUI.view.VForm', {
    extend:'Ext.form.Panel',
    title:'Simple Form',
    bodyPadding:5,
    url:'save-form.php',
    layout:'anchor',
    defaults:{
        anchor:'100%'
    },
    defaultType:'textfield',

    initComponent:function () {
        this.title = this.vfactory.getVData().title;
        this.url = '/fastui/m_windows'
        this.items = this.vfactory.getFormFields(),
        this.callParent();

    },

    // Reset and Submit buttons
    buttons:[
        {
            text:'Reset',
            handler:function () {
                this.up('form').getForm().reset();
            }
        },
        {
            text:'Submit',
            formBind:true, //only enabled once the form is valid
            disabled:true,
            handler:function () {
                var form = this.up('form').getForm();
                if (form.isValid()) {
                    form.submit({
                        success:function (form, action) {
                            Ext.Msg.alert('Success', action.result.msg);
                        },
                        failure:function (form, action) {
                            Ext.Msg.alert('Failed', action.result.msg);
                        }
                    });
                }
            }
        }
    ]
});