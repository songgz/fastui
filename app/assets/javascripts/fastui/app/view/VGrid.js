Ext.define('FastUI.view.VGrid', {
    extend: 'Ext.grid.Panel',
    requires: ['FastUI.store.MListMgr'],
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
            if (record.get('m_entity_id')) {
                this.tab.winCtx.setWinCtx(this.tab.winId, 'm_entity_id', record.get('m_entity_id'));
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
    buildField:function(fields, field){
        field.datatype = field.datatype || '';
        switch (field.datatype) {
            case 'VLookup':
                fields.push({
                    name: field.name.replace('_id', ''),
                    type: 'auto'
                });
                break;

            case 'VSingleChoice':
                fields.push({
                    name: field.name.replace('_id', ''),
                    type: 'auto'
                });
                break;

            case 'VGroup':
                Ext.each(field.members, function(member){
                    this.buildField(fields,member);
                },this);
                break;

            default:
                if(Array.isArray(field)){
                    Ext.each(field, function(f){
                        this.buildField(fields,f);
                    },this);
                }else{
                    fields.push({
                        name: field.name,
                        type: 'auto'
                    });
                }
        }
    },
    getGFields: function () {
        var fields = [];
        Ext.each(this.getMColumns(), function (column) {
            this.buildField(fields, column);
        }, this);
        return fields;
    },
    buildColumn: function(columns, column){
        column.datatype = column.datatype || '';
        switch (column.datatype) {
            case 'VLookup':
                var entity = column.name.replace('_id', '');
                columns.push({
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    xtype:  'templatecolumn',
                    tpl: new Ext.XTemplate('<tpl for="' + entity + '">', '{title}', '</tpl>')
                });
                break;

            case 'MultipleChoice':
                var plur_entity = column.name.replace('_ids', '').pluralize();
                columns.push({
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    xtype:  'templatecolumn',
                    tpl: new Ext.XTemplate('<tpl for="' + plur_entity + '">', '{title}', '</tpl>')
                });
                break;

            case 'VSingleChoice':
                columns.push({
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    renderer: function(val) {
                        var list_store = FastUI.store.MListMgr.getStore(column.name);
                        var index = list_store.findExact('name', val);
                        if (index > -1) {
                            var rs = list_store.getAt(index).data;
                            return rs.title;
                        }
                        return "";
                    }
                });
                break;

            case 'VSexSelect':
                columns.push({
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    renderer: function (val) {
                        return val ? '男' : '女'
                    }
                });
                break;

            case 'VYesOrNo':
                columns.push({
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    renderer: function (val) {
                        return val ? '是' : '否';
                    }
                });
                break;

            case 'VGroup':
                Ext.each(column.members, function (member) {
                    this.buildColumn(columns, member);
                },this);
                break;

            default:
                if(Array.isArray(column)){
                    Ext.each(column, function(c){
                        this.buildColumn(columns, c);
                    },this);
                }else{
                    columns.push({
                        text: column.title,
                        dataIndex: column.name,
                        display: column.display || 'all'
                    });
                }
        }
    },
    getGColumns: function () {
        var columns = [];
        Ext.each(this.getMColumns(), function (column) {
            this.buildColumn(columns,column);
        }, this);
        return columns;
    }
});