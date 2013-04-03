Ext.define('FastUI.view.VVWindow', {
    extend:'Ext.ux.tab.VerticalPanel',
    alias:'widget.vvwindow',
    valueObject: {},
    closable: true,
    activeTab:0,
    plain:true,
    border:false,
    //bodyStyle: 'padding-left: 2px',
    defaults:{autoScroll:true, border: false},
    tabsConfig:{
        width:130,
        textAlign:'left',
        marginTop:50    /* Push the tab strip down 30px from top. If not set, defaults to 0.*/
    },

    initComponent:function () {
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
        beforerender:function (vwindow, opts) {
            this.loadTabs(vwindow, opts);
        }
    },
    loadTabs:function (vwindow, opts) {
        vwindow.getSubTabs(0,'');
        Ext.each(vwindow.subs, function (mtab) {
            var vTab ;
//            switch(vwindow.getValue('window_kind')){
//                case 'maintain':
//                     vTab = Ext.create('FastUI.view.VTab', {
//                        valueObject: mtab,
//                        winId:vwindow.id,
//                        winCtx: vwindow.winCtx
//                    });
//                    break;
//                case 'custom':
//                    vTab = Ext.create('FastUI.view.VCustomTab', {
//                        valueObject: mtab,
//                        winId:vwindow.id,
//                        winCtx: vwindow.winCtx
//                    });
//                    break;
//            }
            var vTab = Ext.create('FastUI.view.VTab', {
                valueObject: mtab,
                winId:vwindow.id,
                winCtx: vwindow.winCtx
            });
            vwindow.add(vTab);
        });
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
