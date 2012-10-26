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
        this.url = '/fastui/m_windows.json'
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
//                if (form.isValid()) {
                    form.submit({
                        success:function (form, action) {
                            Ext.Msg.alert('Success', action.result.msg);
                        },
                        failure:function (form, action) {
                            Ext.Msg.alert('Failed', action.result.msg);
                        }
                    });
//                }
            }
        }
    ]
//    submitForm: function(){
//        Ext.MessageBox.show({
//            title: '\u8bf7\u7a0d\u7b49',//请稍等
//            msg: '\u6b63\u5728\u63d0\u4ea4...',//正在提交...
//            progressText: '',
//            width: 300,
//            progress: true,
//            closable: false,
//            animEl: 'loding'
//        });
//        //set the speed of the submit action
//        var f = function(v){
//            return function(){
//                var i = v/11;
//                Ext.MessageBox.updateProgress(i, '');
//            };
//        }
//        for(var i = 1; i < 13; i++){
//            setTimeout(f(i), i*150);
//        }
//        this.form.submit({
//            url     : this.url,
//            params  : this.params,
//            success : this.onSuccess,
//            failure : this.onFailure,
//            scope   : this});
//    },
//
//    onSuccess: function(){
//        Ext.MessageBox.alert('\u63d0\u793a', '\u64cd\u4f5c\u6210\u529f\uff01');//'提示', '操作成功！'
////        this.findParentBy(function(c){return Rib.vp.VTab.prototype.isPrototypeOf(c)}).load_grid();
////       this.findParentByType(Rib.vp.VTab).loadGrid();
//    },
//
//    onFailure: function(){
//        Ext.MessageBox.alert('\u63d0\u793a', '\u64cd\u4f5c\u5931\u8d25\uff01');//'提示', '操作失败！'
//    }
});