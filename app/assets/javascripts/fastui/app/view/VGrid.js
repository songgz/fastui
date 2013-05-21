Ext.define('FastUI.view.VGrid', {
    extend: 'Ext.grid.Panel',
    requires: ['FastUI.store.MListMgr', 'FastUI.view.vfield.VFieldFactory','FastUI.view.DataFieldFactory', 'FastUI.view.GridColumnFactory'],
    tab: {},
    selType: 'rowmodel',
    multiSelect: false,
    border: false,
    //plugins: [Ext.create('Ext.grid.plugin.CellEditing', {clicksToEdit: 1})],
    initComponent: function () {
        this.title = this.getValue('title');
        this.store = this.getGStore();
        this.store.pageSize = 6;

        this.columns = this.getGColumns();
        this.bbar = this.pageBar();
        this.callParent();
    },
    pageBar: function () {
        this.bar = Ext.create('Ext.toolbar.Paging', {
            store: this.store,
            displayInfo: true,
            beforePageText: '第',
            afterPageText: '页共 {0}页',
            displayMsg: '显示第{0} 条到第 {1} 条记录，总共{2}条记录'
        }, this);
        return this.bar;
    },
    listeners: {
        itemclick: function (view, record, item, index, e, eOpts) {
            //alert(this.tab.rest.getKey() + '='+ record.get('id'));
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

    getGStore: function () {
        var jsonStore = new Ext.data.JsonStore({
            autoLoad: true,
            proxy: {
                type: 'ajax',
                url: this.tab.rest.indexPath(),
                reader: {
                    type: 'json',
                    root: 'rows',
                    totalProperty: "totalCount"
                },
                extraParams: this.tab.getParams()
            },
            fields: this.getGFields()
        });
//        jsonStore.load({
//            scope: this,
//            callback: function(records, operation, success) {
//                console.log(jsonStore.getCount());
//
//            }
//        });
        return jsonStore;
    },
    getMEntity: function () {
        return this.tab.valueObject.entity;
    },
    getMColumns: function () {
        return this.tab.valueObject.members || [];
    },

    getGFields: function () {
        var fields = [];
        Ext.each(this.getMColumns(), function (column) {
            //this.buildField(fields, column);
            FastUI.view.DataFieldFactory.buildField(fields,column);
            //fields.push(FastUI.view.vfield.VFieldFactory.buildField(column, this.tab.winCtx, this.tab.winId, this.tab.rest).data());
        }, this);
        return fields;
    },

    getGColumns: function () {
        var columns = [];
        Ext.each(this.getMColumns(), function (column) {
            //this.buildColumn(columns,column);
            FastUI.view.GridColumnFactory.buildColumn(columns, column);
            //alert('ss');
            //columns.push(FastUI.view.vfield.VFieldFactory.buildField(column, this.tab.winCtx, this.tab.winId, this.tab.rest).column());
        }, this);
        return columns;
    }
});