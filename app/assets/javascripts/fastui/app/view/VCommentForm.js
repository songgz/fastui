

var imgtpl = new Ext.XTemplate('<img src="http://www.sencha.com/img/20110215-feat-html5.png"/>')



Ext.define('FastUI.view.VCommentForm', {
    extend:'Ext.form.Panel',
    title:'Comment Form ',
    bodyPadding:5,
    layout:'anchor',
    fieldDefaults: {
        labelAlign: 'left',
        labelWidth: 90,
        anchor: '60%'
    },
    defaultType:'textfield',
    border:true,
    items: [
        {
            xtype: 'textfield',
            name: 'm_comment[title]',
            fieldLabel: '名称'
        },
        {
            xtype: 'textareafield',
            name: 'm_comment[note]',
            fieldLabel: '描述'
        },
        {
            xtype: 'textfield',
            name: 'm_comment[guide]',
            fieldLabel: '指导'
        },
        {
            xtype: 'numberfield',
            name: 'm_comment[total]',
            fieldLabel: '总分'
        },
        {
            xtype: 'textareafield',
            name: 'm_comment[memo]',
            fieldLabel: '备注'
        },
        {
            xtype: 'field',
            fieldLabel: '量规',
            name: 'criteria',
            fieldSubTpl: imgtpl

        }
    ],
    initComponent:function () {

//        this.items.push(Ext.create('FastUI.view.VCriteria'));
        this.callParent();
    }
});