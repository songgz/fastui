
Ext.define('FastUI.view.VGrid', {
    extend: 'Ext.grid.Panel',
    initComponent:function(){
//        this.model_class = this.mtab.get('model_class');
        this.model_class = 'm_tab';
        alert(this.model_class);
        if(this.model_class){
            this.columns = this.gridColumns();
            this.store = this.gridStore();
        }
        this.callParent();
    },
    gridStore:function(){
//        alert(this.mtab.get('model_class'));
//        alert(this.model_class);
        alert(this.constructModelName());
      return Ext.create('Ext.data.Store', {
//           model: 'FastUI.model.MWindow',
           model:'FastUI.model.'+this.constructModelName(),
           autoLoad: true
        });
    },
    gridColumns:function(){
       var columns = [];
       this.mtab.mcolumns().each(function(column){
           columns.push({header:column.get('title'),dataIndex:column.get('data_index')});
       });
//        [{header:'ID',dataIndex:'id'},{header:'窗口名称',dataIndex:'title'}];
       return columns;
    },
    constructModelName:function(){
        var codes = this.model_class.split('_');
        var model_name = '';
        for( var i =0 ;i < codes.length;i++){
            model_name += codes[i].substring(0,1).toUpperCase()+ codes[i].substring(1,codes[i].length);
        }
        return model_name;
    }
});