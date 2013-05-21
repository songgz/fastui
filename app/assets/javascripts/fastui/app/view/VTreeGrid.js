Ext.define('FastUI.view.VTreeGrid', {
    extend: 'Ext.tree.Panel',
    requires: ['FastUI.store.MListMgr', 'FastUI.view.DataFieldFactory', 'FastUI.view.GridColumnFactory'],
    collapsible: true,
    useArrows: true,
    rootVisible: false,
    multiSelect: false,
    singleExpand: true,
    border: false,
    initComponent: function () {
        this.title = this.getValue('title');
        this.columns = this.getTreeGColumns();
        this.store = this.getTreeGStore();
        this.callParent();
    },
    listeners:{
        itemclick:function (view, record, item, index, e, eOpts) {
            this.tab.winCtx.setWinCtx(this.tab.winId, this.tab.rest.getKey(), record.get('id'));
            this.tab.winCtx.setWinCtx(this.tab.winId, this.tab.rest.getTitle(), record.get('title'));
            if (record.get('entity')) {
                this.tab.winCtx.setWinCtx(this.tab.winId, 'entity', record.get('entity'));
            }
            this.tab.getBtn('edit').enable();
            this.tab.getBtn('del').enable();
        }
    },
    selectedId: function () {
        var id = 0;
        var records = this.getSelectionModel().getSelection();
        if (!Ext.isEmpty(records)) {
            id = records[0].get('id');
        }
        return id;
    },
    getValue: function (key) {
        return this.tab.valueObject[key] || '';
    },

    getTreeGStore: function () {
        return new Ext.data.TreeStore({
            autoLoad: true,
            //autoSync: true,
            proxy:{
                type: 'ajax',
                url: this.tab.rest.indexPath(),
                reader:{
                    type:'json',
                    root:'',
                    record:''
                    //successProperty:''
                }
            },
            root: {
                text:'Root',
                id:'',
                expanded: true
            },
            fields: this.getTreeGFields()
        })
    },
    getMColumns: function () {
        return this.tab.valueObject.members || [];
    },
    getTreeGFields: function () {
        var fields = [];
        Ext.each(this.getMColumns(), function (column) {
            FastUI.view.DataFieldFactory.buildField(fields,column);
        }, this);
        return fields;
    },
    getTreeGColumns: function () {
        var columns = [];
        Ext.each(this.getMColumns(), function (column) {
            FastUI.view.GridColumnFactory.buildColumn(columns,column);
        }, this);
        return columns;
    }
});



