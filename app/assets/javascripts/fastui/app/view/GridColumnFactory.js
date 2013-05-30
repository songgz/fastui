Ext.define('FastUI.view.GridColumnFactory', {
    singleton: true,

    buildColumn: function(columns, column){
        column.datatype = column.datatype || '';
        switch (column.datatype) {
            case 'VInteger':
                columns.push({
                    xtype: 'numbercolumn',
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    width: column.column_width || 100,
                    format:'0'
                });
                break;

            case 'VNumber':
                columns.push({
                    xtype: 'numbercolumn',
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    width: column.column_width || 100
                });
                break;

            case 'VTreeText':
                columns.push({
                    xtype: 'treecolumn',
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    width: column.column_width || 100,
                    flex: 2.5
                });
                break;

            case 'VTree':
                var entity = column.name.replace('_id', '');
                columns.push({
                    xtype:  'templatecolumn',
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    width: column.column_width || 100,
                    tpl: new Ext.XTemplate('<tpl for="' + entity + '">', '{title}', '</tpl>')
                });
                break;

            case 'VTable':
                var entity = column.name.replace('_id', '');
                columns.push({
                    xtype:  'templatecolumn',
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    width: column.column_width || 100,
                    tpl: new Ext.XTemplate('<tpl for="' + entity + '">', '{title}', '</tpl>')
                });
                break;

            case 'VLookup':
                var entity = column.name.replace('_id', '');
                columns.push({
                    xtype:  'templatecolumn',
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    width: column.column_width || 100,
                    tpl: new Ext.XTemplate('<tpl for="' + entity + '">', '{title}', '</tpl>')
                });
                break;

            case 'MultipleChoice':
                var plur_entity = column.name.replace('_ids', '').pluralize();
                columns.push({
                    xtype:  'templatecolumn',
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    width: column.column_width || 100,
                    tpl: new Ext.XTemplate('<tpl for="' + plur_entity + '">', '{title}', '</tpl>')
                });
                break;

            case 'VSingleChoice':
                columns.push({
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    width: column.column_width || 100,
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

            case 'VList':
                columns.push({
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    width: column.column_width || 100,
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

            case 'VRadio':
                columns.push({
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    width: column.column_width || 100,
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

            case 'VBoolean':
                columns.push({
                    xtype: 'booleancolumn',
                    text: column.title,
                    dataIndex: column.name,
                    display: column.display || 'all',
                    width: column.column_width || 100,
                    trueText: '√',
                    falseText: '×'
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
                        display: column.display || 'all',
                        width: column.column_width || 100
                    });
                }
        }
    }
});