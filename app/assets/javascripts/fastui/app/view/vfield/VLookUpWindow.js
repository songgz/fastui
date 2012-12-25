Ext.define('FastUI.view.vfield.VLookUpWindow', {
    extend:'Ext.form.field.ComboBox',
    alias:'widget.vlookupwindow',
    editable:false,
    displayField:'title',
    valueField:'id',
    initComponent:function () {
        this.store = Ext.create('Ext.data.ArrayStore', {
            fields:['id', 'title'],
            data:[]
        });
//        this.store = new Ext.data.JsonStore({
//            autoLoad:true,
//            fields:['id', 'title'],
//            proxy:{
//                type:'ajax',
//                url:'/fastui/' + this.entity.name.toLowerCase().pluralize() + '.json',
//                reader:{
//                    type:'json',
//                    root:'rows',
//                    totalProperty:"totalCount"
//                }
//            }
//        });
        this.windowStore = this.getStore();
        this.callParent();
    },
    setValue:function(value){
        if(value && value.id && value.title){
            this.store.add(value);
            this.setValue(value.id);
        }else{
            this.callParent(arguments);
        }
    },

    onTriggerClick:function () {
        this.loadWindow();
    },
    loadWindow:function () {
        this.window = Ext.create('Ext.window.Window', {
            title:this.entity.title,
            height:300,
            width:600,
            layout:'fit',
            items:this.getGrid()
        }).show();
    },
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
    getGrid:function () {
        this.grid = Ext.create('Ext.grid.Panel', {
            vlookup:this,
            border:false,
            store:this.windowStore,
            tbar:this.searchPanel(),
            columns:[
                {header:'ID', dataIndex:'id'},
                {header:'Title', dataIndex:'title'}
            ],
            bbar:this.pageBar(),
            listeners:{
                itemclick:function (grid, record, item, index, e, eOpts) {
                    var id = record.get('id');
                    if (!this.vlookup.store.getById()){
                        this.vlookup.store.add({id:id,title:record.get('title')});
                    }
                    this.vlookup.setValue(id);
                }
            }
        }, this);
        return this.grid
    },
    pageBar:function () {
        this.pagebar = Ext.create('Ext.toolbar.Paging', {
            store:this.windowStore,
            displayInfo:true,
            beforePageText:'第',
            afterPageText:'页共 {0}页',
            displayMsg:'显示第{0} 条到第 {1} 条记录，总共{2}条记录'
        }, this);
        return this.pagebar;
    },
    getParams:function(){
        var p = {};
        switch(this.entity.name){
            case 'Fastui::MProperty':
//                p['m_entity_id'] = this.m_entity_id;
                p['m_entity_id'] = FastUI.Env.get('m_entity_id');
                return p;
                break;
            case 'Fastui::MTab':
//                p['m_window_id'] = this.m_window_id;
//                alert(FastUI.Env.getWinCtx('winNo','win_id'));
                p['m_window_id'] = FastUI.Env.get('m_window_id');
                return p;
                break;
        }
    },
    getStore:function () {
        return new Ext.data.JsonStore({
            autoLoad:{start:0, limit:2},
            pageSize:2, // items per page
            fields:['id', 'title'],
            proxy:{
                type:'ajax',
                extraParams:this.getParams(),
                url:this.entity.name.underscore().pluralize() + '.json',
                reader:{
                    type:'json',
                    root:'rows',
                    totalProperty:"totalCount"
                }
            }
        });
    }

});