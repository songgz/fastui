Ext.define('FastUI.view.VCriteria', {
    extend: 'Ext.container.Container',
    width: 400,
    renderTo:{},
    layout:'anchor',
    defaults: {
        labelAlign: 'left',
        labelWidth: 90,
        anchor: '60%'
    },
    items: [{
        xtype: 'textfield',
        name: 'm_comment[criteria][0][note]',
        fieldLabel: '标准'
    }
    ],
    initComponent: function () {
        console.log();
        this.callParent();
    }

});



