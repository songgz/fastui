/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 13-2-18
 * Time: 下午3:30
 * To change this template use File | Settings | File Templates.
 */

Ext.define('FastUI.view.VTreeGrid', {
    extend:'Ext.tree.Panel',
    tab:{},
    width: 500,
    height: 300,
    renderTo: Ext.getBody(),
    collapsible: true,
    useArrows: true,
    rootVisible: false,
    multiSelect: false,
    singleExpand: true,
    border:true,
    initComponent:function () {
        this.title = this.getValue('title');
        this.columns = this.getTreeGColumns();
        this.store = this.getTreeGStore();
        this.callParent();
    },
    getValue:function (key) {
        return this.tab.valueObject[key];
    },

    getTreeGStore:function () {
        return new Ext.data.JsonStore({
            autoLoad:true,
            pageSize:50,
            proxy:{
                type:'ajax',
                url:this.tab.rest.indexPath(),
                reader:{
                    type:'json',
                    root:'',
                    id:"id"
                }
            },
            fields:this.getTreeGFields()
            })
    },
    getMColumns:function () {
        return this.tab.valueObject.m_columns;
    },
    getTreeGFields:function () {
        var fields = [];
        Ext.each(this.getMColumns(), function (column) {
            var field = {
                name:column.m_property.name,
                type:'auto'
            };
            var prop = column.m_property;
            switch (prop.m_datatype.class_name) {
                case 'Fastui::MRelation':
                    var entity = {
                        name:column.m_property.name.replace('_id', ''),
                        type:'auto'
                    };
                    fields.push(entity);
            }
            fields.push(field);
        }, this);
        return fields;
    },
    getTreeGColumns:function () {
        var columns = [Ext.create('Ext.grid.RowNumberer')];
        if (this.getMColumns() <= 0) return columns;
        Ext.each(this.getMColumns(), function (column) {
            var col = {
                text:column.title,
                dataIndex:column.m_property.name,
                width:column.width
            };
            var prop = column.m_property;
            switch (prop.m_datatype.class_name) {
                case 'Fastui::MTree':
                    col.xtype = 'treecolumn';
                    break;
                case 'Fastui::MRelation':
                    col.xtype = 'templatecolumn';
                    col.tpl = '{' + prop.name.replace('_id', '') + '.title}';
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



