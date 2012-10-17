/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-10-16
 * Time: 下午4:24
 * To change this template use File | Settings | File Templates.
 */
Ext.define('FastUI.view.VTab', {
    extend: 'Ext.Panel',
    alias: 'widget.vtab',
    title: 'All VTabs',
    initComponent: function(){
        Ext.apply(this,{
            layout: "card",
            deferredRender: false,
            title: this.mTab.getName(),
            model: this.mTab.getModel(),
            tabTip: this.mTab.getDesc(),
            tbar: this.getTbar()
        });
//        Rib.vp.VTab.superclass.initComponent.call(this);
    }
});
