Ext.define('FastUI.view.VTreeGrid', {
    extend: 'Ext.tree.Panel',
    requires: ['FastUI.store.MListMgr'],
    collapsible: true,
    useArrows: true,
    rootVisible: false,
    multiSelect: false,
    singleExpand: true,
    border: false,
    initComponent: function () {
        this.title = this.getValue('title');
        this.columns = this.getTreeGColumns();
        this.store = new Ext.data.TreeStore({
            autoLoad: true,
            fields: this.getTreeGFields(),
            proxy: {
                type: 'ajax',
                url: this.tab.rest.indexPath(),
                reader:{
                    type:'json',
                    root:'',
                    record:''
                    //successProperty:''
                }
            },
            //folderSort: true,
            root: {
                expanded: true
            }
        });
        this.callParent();
    },
    listeners:{
        itemclick:function (view, record, item, index, e, eOpts) {
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
        return this.tab.valueObject[key];
    },

//    getTreeGStore: function () {
//        return new Ext.data.TreeStore({
//            autoLoad: false,
//            proxy: {
//                type: 'ajax',
//                url: this.tab.rest.indexPath()
//            },
//            folderSort: true,
//            root: {
//                expanded: true,
//                loaded: true
//            },
//            fields: this.getTreeGFields()
//        })
//    },
    getMColumns: function () {
        return this.tab.valueObject.tabs;
    },
    getTreeGFields: function () {
        var fields = [];
        Ext.each(this.getMColumns(), function (column) {
            var field = {
                name: column.name,
                type: 'auto'
            };
            switch (column.datatype) {
                case 'VLookup':
                    var entity = {
                        name: column.name.replace('_id', ''),
                        type: 'auto'
                    };
                    fields.push(entity);
            }
            fields.push(field);
        }, this);
        return fields;
    },
    getTreeGColumns: function () {
        var columns = [];
        Ext.each(this.getMColumns(), function (column) {
            var col = {
                text: column.title,
                dataIndex: column.name,
                width: column.width
            };

            switch (column.datatype) {
                case 'VTree':
                    col.xtype = 'treecolumn';
                    col.flex = 2;
                    break;
                case 'VLookup':
                    col.xtype = 'templatecolumn';
                    var entity = column.name.replace('_id', '');
                    col.tpl = new Ext.XTemplate(
                        '<tpl for="' + entity + '">',
                        '<p>{title}</p>',
                        '</tpl>'
                    );
                    break;
                case 'VSingleChoice':
                    var list_store = FastUI.store.MListMgr.getStore(column.name);
                    col.renderer = function (val) {
                        var index = list_store.findExact('name', val);
                        if (index > -1) {
                            var rs = list_store.getAt(index).data;
                            return rs.title;
                        }
                        return "";
                    };
                    break;
                case 'VSexSelect':
                    col.renderer = function (val) {
                        return val ? '男' : '女'
                    };
                    break;
                case 'VYesOrNo':
                    col.renderer = function (val) {
                        return val ? '是' : '否';
                    };
                    break;
                default:
                    break;
            }
            columns.push(col);
        }, this);

        return columns;
    }
});



