Ext.define('FastUI.view.VVWindow', {
    extend:'Ext.ux.tab.VerticalPanel',
    alias:'widget.vvwindow',
    valueObject: {},
    //activeGroup:0,

    activeTab:0,
    plain:true,
    border:false,
    //bodyStyle: 'padding: 10px',
    defaults:{autoScroll:true},
    tabsConfig:{
        width:130,
        textAlign:'right',
        marginTop:50    /* Push the tab strip down 30px from top. If not set, defaults to 0.*/
    },

    initComponent:function () {
        this.ctx = FastUI.Env.getCtx();
        this.title = this.getValue('title');

        this.callParent();
    },
    getValue:function(key){
        return this.valueObject[key];
    },
    getTabValues:function(){
        return this.valueObject.m_tabs;
    },
    listeners:{
        beforerender:function (vwindow, opts) {
            this.loadTabs(vwindow, opts)
        }
    },
    loadTabs:function (vwindow, opts) {
        Ext.each(vwindow.getTabValues(), function (mtab) {
            var vTab = Ext.create('FastUI.view.VTab', {
                valueObject: mtab,
                windowNo:vwindow.id,
                ctx: vwindow.ctx,
                vfactory:Ext.create('FastUI.view.VFactory', mtab)
            });
            vwindow.add(vTab);
        });
    }
});
