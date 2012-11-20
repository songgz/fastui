Ext.define('FastUI.view.vfield.VLookUpWindow', {
    extend:'Ext.form.field.ComboBox',
    alias:'widget.vlookupwindow',
    editable:false,
    displayField: 'title',
    valueField: 'id',
    initComponent:function () {
        this.store = this.getStore();
        this.callParent();
    },
    onTriggerClick:function () {
        this.loadWindow();
    },
    loadWindow:function () {
        this.window = Ext.create('Ext.window.Window', {
            title:this.entity.title,
            height:200,
            width:400,
            layout:'fit',
            items:this.getGrid()
        }).show();
    },
    searchPanel:function(){
        this.tbar = ['标题',{
            xtype: 'textfield',
            name: 'searchField',
            hideLabel: true,
            width: 200,
            listeners: {
            }
        },{ xtype: 'button', text: '搜索' }];
        return this.tbar
    },
    getGrid:function(){
        this.grid = Ext.create('Ext.grid.Panel', {
            vlookup:this,
            border:false,
            store:this.store,
            tbar:this.searchPanel(),
            columns:[
                {header:'ID', dataIndex:'id'},
                {header:'Title', dataIndex:'title'}
            ],
            bbar:this.pageBar(),
            listeners:{
                itemclick:function (grid, record, item, index, e, eOpts) {
                    this.vlookup.setValue(record.get('id'));
                }
            }

        },this);
        return this.grid
    },
    pageBar:function(){
        this.pagebar = Ext.create('Ext.toolbar.Paging', {
            store: this.store,
            displayInfo: true
//            displayMsg: '显示第{0} 条到 {1} 条记录，总共{2}条记录'
        },this);
        return this.pagebar;
    },
    getStore:function () {
        return new Ext.data.JsonStore({
            autoLoad:{start: 0, limit: 2},
            pageSize: 2 ,// items per page
            fields:['id', 'title'],
            proxy:{
                type:'ajax',
                url:'/fastui/' +this.entity.name.toLowerCase().pluralize() + '.json',
                reader:{
                    type:'json',
                    root:'rows',
                    totalProperty : "totalCount"

                }
            }
        });
    }

});