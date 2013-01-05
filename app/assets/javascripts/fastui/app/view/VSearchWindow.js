Ext.define('FastUI.view.VSearchWindow', {
    extend:'Ext.window.Window',
    rest:{},
    height:300,
    width:600,
    layout:'fit',
    vlookup:{},

    initComponent:function () {

        this.title = this.getValue('title');
        this.items = {
            xtype: 'grid',
            border: false,
            columns: [
                {header:'ID', dataIndex:'id'},
                {header:'Title', dataIndex:'title'}
            ],
            store: this.getStore(), // A dummy empty data store
            listeners:{
                itemclick:function (grid, record, item, index, e, eOpts) {
                    var id = record.get('id');
                    if (!this.vlookup.store.getById(id)){
                        this.vlookup.store.add({id:id,title:record.get('title')});
                    }
                    this.vlookup.setValue(id);
                },
                scope:this
            }
        };
        this.tbar = this.searchPanel();
        this.bbar = this.pageBar();
        this.callParent();
    },
    getValue:function (key) {
        return this.vlookup.valueObject.m_property.m_datatype[key];
    },
    getMEntity:function(){
        return this.vlookup.valueObject.m_property.m_datatype.m_entity;
    },

//    getDataType:function(){
//        return this.this.vlookup.valueObject.class_name
//    },

    searchPanel:function () {
        this.tbar = ['标题', {
            xtype:'textfield',
            id:'searchField',
            hideLabel:true,
            width:200,
            listeners:{
            }
        }, { xtype:'button', text:'搜索',
            handler:function () {
                var searchText = Ext.getCmp('searchField').getValue();
                this.store.load({
                    params:{
                        search:searchText
                    }})
            }, scope:this}];
        return this.tbar
    },

    pageBar:function () {
        this.pagebar = Ext.create('Ext.toolbar.Paging', {
            //store:this.getStore(),
            displayInfo:true,
            beforePageText:'第',
            afterPageText:'页共 {0}页',
            displayMsg:'显示第{0} 条到第 {1} 条记录，总共{2}条记录'
        }, this);
        return this.pagebar;
    },
    getParams:function(){
        var s = "{m_window_id:${m_window_id}}";
        s = this.vlookup.winCtx.parseCtx(this.vlookup.winId,s);
        return Ext.decode(s);
    },
    getStore:function () {
        var rest = Ext.create('FastUI.view.Rest', this.getMEntity().name);
        return new Ext.data.JsonStore({
            autoLoad:{start:0, limit:2},
            pageSize:2, // items per page
            fields:['id', 'title'],
            proxy:{
                type:'ajax',
                extraParams:this.getParams(),
                url:rest.indexPath(), //+ '?' + this.getParams(),
                reader:{
                    type:'json',
                    root:'rows',
                    totalProperty:"totalCount"
                }
            }
        });
    }


});
