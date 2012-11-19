Ext.define('FastUI.view.Inflector',{
//    singleton: true,
//    alias: ['Inflector'],
    pluralize:function(model_class){
        var pos = model_class.lastIndexOf('_');
        var front = model_class.substr(0,pos+1);
        var rear = model_class.substr(pos+1,model_class.length -1);
        return  front+  Ext.util.Inflector.pluralize(rear);
    }
});
