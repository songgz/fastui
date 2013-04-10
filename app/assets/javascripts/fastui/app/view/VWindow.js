Ext.define('FastUI.view.VWindow', {
    extend:'Ext.TabPanel',
    requires:['FastUI.Env'],
    alias:'widget.vwindow',
    valueObject: {},
    activeTab:0,
    closable: true,
    tabPosition : "left",
    border:true,
    initComponent:function(){
        this.winCtx = FastUI.Env.getCtx();
        this.title = this.getValue('title');
        this.subs = [];
        this.callParent();
    },
    getValue:function(key){
        return this.valueObject[key];
    },
    getTabValues:function(){
        return this.valueObject.m_tabs;
    },
    listeners:{
        afterrender: function(vwindow, opts) {

        },
        beforerender:function (vwindow, opts) {
            this.loadTabs(vwindow, opts);
        }
    },
    loadTabs:function (vwindow, opts) {
        //vwindow.getSubTabs(0,'');
        Ext.each(vwindow.getTabValues(), function (mtab) {
            var vTab = Ext.create('FastUI.view.VTab', {
                valueObject: mtab,
                winId:vwindow.id,
                winCtx: vwindow.winCtx
            });
            vwindow.add(vTab);
        });
        vwindow.setActiveTab(0);
    },
    getSubTabs:function(pid,level){
        Ext.each(this.getTabValues(),function(tab){
            if(tab.included_tab_id == pid){
                tab.level =  level;
                this.subs.push(tab);
                this.getSubTabs(tab.id,level + '　');
            }
        },this);
    }
});

