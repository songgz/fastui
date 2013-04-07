var imgtpl = new Ext.XTemplate('<img src="http://www.sencha.com/img/20110215-feat-html5.png"/>')


Ext.define('FastUI.view.VCommentForm', {
    extend: 'Ext.form.Panel',
    title: 'Comment Form ',
    bodyPadding: 5,
    layout: 'anchor',
    fieldDefaults: {
        labelAlign: 'left',
        labelWidth: 90,
        anchor: '60%'
    },
    defaultType: 'textfield',
    border: true,
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
            xtype: 'imagefield',
            fieldLabel: '量规',
            name: 'criteria',
            listeners: {
                click: function () {
//                  Ext.create('FastUI.view.VCriteria',{renderTo:this});

                }
            }
        }
    ],
    initComponent: function () {
        this.callParent();
    },
    addCriterion: function(){

    }
});
Ext.define('Ext.ux.field.ImageField', {
    extend: 'Ext.form.field.Base',
    alias: 'widget.imagefield',
    fieldSubTpl: ['<img id="{id}" class="{fieldCls}" src="images/fastui/list1211.png" />', {
        compiled: true,
        disableFormats: true
    }],

    fieldCls: Ext.baseCSSPrefix + 'form-image-field',
    value: null,


    initEvents: function () {
        this.callParent();

        //Adding the click event (can make other events here aswell)
        this.inputEl.on('click', this._click, this, {
//            delegate: 'img.form-image-field'
        });

    },

    setValue: function (v) {
        var me = this;
        me.callParent(arguments);

        //Change ur image value here...
    },

    onRender: function () {
        var me = this;
        me.callParent(arguments);

        var name = me.name || Ext.id();

        me.hiddenField = me.inputEl.insertSibling({
            tag: 'input',
            type: 'hidden',
            name: name
        });

        me.setValue(me.value);
    },

    _click: function (e, o) {
        this.fireEvent('click', this, e);
    }
});






