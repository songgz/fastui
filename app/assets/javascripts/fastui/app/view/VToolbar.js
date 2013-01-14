Ext.define('FastUI.view.VToolbar', {
    extend:'Ext.toolbar.Toolbar',
    valueObject:{},
    winId:0,
    winCtx:{},
    initComponent:function () {
        this.items = [
            {
                text: 'Button'
            },
            {
                xtype: 'splitbutton',
                text : 'Split Button'
            },
            '->',
            {
                xtype    : 'textfield',
                name     : 'field1',
                emptyText: 'enter search term'
            }
        ]
    }
});