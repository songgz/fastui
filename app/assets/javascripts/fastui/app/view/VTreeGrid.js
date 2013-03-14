/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 13-2-18
 * Time: 下午3:30
 * To change this template use File | Settings | File Templates.
 */

Ext.define('FastUI.view.VTreeGrid', {
    extend: 'Ext.tree.Panel',
    requires: ['FastUI.store.MListMgr'],
    tab: {},
    width: 500,
    height: 300,
    renderTo: Ext.getBody(),
    collapsible: true,
    useArrows: true,
    rootVisible: false,
    multiSelect: false,
    singleExpand: true,
    border: true,
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

    getTreeGStore: function () {
        return new Ext.data.TreeStore({
            autoLoad: false,
            proxy: {
                type: 'ajax',
                url: this.tab.rest.indexPath()
            },
            folderSort: true,
            root: {
                expanded: true,
                loaded: true
            },
            fields: this.getTreeGFields()
        })
    },
    getMColumns: function () {
        return this.tab.valueObject.m_columns;
    },
    getTreeGFields: function () {
        var fields = [];
        Ext.each(this.getMColumns(), function (column) {
            var field = {
                name: column.m_property.name,
                type: 'auto'
            };
            var prop = column.m_property;
            switch (prop.m_datatype.class_name) {
                case 'Fastui::MRelation':
                    var entity = {
                        name: column.m_property.name.replace('_id', ''),
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
        if (this.getMColumns() <= 0) return columns;
        Ext.each(this.getMColumns(), function (column) {
            var col = {
                text: column.title,
                dataIndex: column.m_property.name,
                width: column.width
            };
            var prop = column.m_property;
            switch (prop.m_datatype.class_name) {
                case 'Fastui::MTree':
                    col.xtype = 'treecolumn';
                    col.flex = 2;
                    break;
                case 'Fastui::MRelation':
                    col.xtype = 'templatecolumn';
                    var entity = prop.name.replace('_id', '');
                    col.tpl = new Ext.XTemplate(
                        '<tpl for="' + entity + '">',
                        '<p>{title}</p>',
                        '</tpl>'
                    );
                    break;
                case 'Fastui::MList':
                    var list_store = FastUI.store.MListMgr.getStore(prop.m_datatype_id);
                    col.renderer = function (val) {
                        var index = list_store.findExact('name', val);
                        if (index > -1) {
                            var rs = list_store.getAt(index).data;
                            return rs.title;
                        }
                        return "";
                    };
                    break;
                case 'Fastui::MSexSelect':
                    col.renderer = function (val) {
                        return val ? '男' : '女'
                    };
                    break;
                case 'Fastui::MYesOrNo':
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



