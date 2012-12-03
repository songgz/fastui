/**
 * Created with JetBrains RubyMine.
 * User: Administrator
 * Date: 12-12-3
 * Time: 上午9:39
 * To change this template use File | Settings | File Templates.
 */
Ext.define('FastUI.view.VHelpWindow', {
    extend:'Ext.window.Window',
    title:'帮助',
    width: 500,
    height: 300,
    resizable: true,
    maximizable: true,
    minimizable: true,
    autoScroll: true,
    closeAction: 'close' ,
    initComponent:function(){
        this.callParent();
    }
});