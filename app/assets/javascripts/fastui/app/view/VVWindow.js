Ext.define('FastUI.view.VVWindow', {
    extend:'Ext.ux.tab.VerticalPanel',
    alias:'widget.vvwindow',
    title:'The VWindow',
    //activeGroup:0,
    activeTab: 0,
    plain:true,
    border: false,
    //bodyStyle: 'padding: 10px',
           defaults:{autoScroll: true},
           tabsConfig: {
               width: 130,
               textAlign: 'right',
               marginTop: 50	/* Push the tab strip down 30px from top. If not set, defaults to 0.*/
           },

    initComponent:function () {
        this.title = this.vfactory.getVData().title;
        FastUI.Env.setWinCtx('winNo','win_id',this.id);
//        alert(FastUI.Env.getWinCtx('winNo','win_id'));
//        alert(Ext.encode(FastUI.Env.getCtx()));
        this.callParent();

    },
    listeners:{
        beforerender:function (vwindow, opts) {
            this.loadTabs(vwindow, opts)
        }
    },
    loadTabs:function (vwindow, opts) {
        Ext.each(this.vfactory.getVData().m_tabs, function (mtab) {
//            alert(mtab.m_entity.name)
            var vTab = Ext.create('FastUI.view.VTab', {vfactory: Ext.create('FastUI.view.VFactory',mtab)});
//            this.items= [ {expanded:false,items:{
//                                title: 'Users',
//                                iconCls: 'x-icon-users',
//                                tabTip: 'Users tabtip',
//                                style: 'padding: 10px;',
//                                html: "Ext.example.shortBogusMarkup"
//                            }                }]
            vwindow.add(vTab);
        });
    }
});
