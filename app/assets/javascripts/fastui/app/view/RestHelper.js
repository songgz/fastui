Ext.define('FastUI.view.RestHelper', {
    name:'restHelper',

    constructor:function (model_class) {
        this.model_class = model_class;

        if(this.model_class){
            //Ext.util.Inflector.pluralize('word'); //'words'
                    //Ext.util.Inflector.singularize('words'); //'word'
                    this.resource = Ext.util.Inflector.singularize(model_class.toLowerCase());
        }
        this.root = '/fastui';
        this.ext = '.json';
    },
    getPath:function(action, id){
//        var url = Inflector.pluralize(this.mTab.getModel());
//        var parent_tab = this.mTab.getIncludedTab();
//        if(parent_tab){
//            var id = 0;
//            var include_tab = this.findParentByType(Ext.TabPanel).find("model",parent_tab.getModel());
//            if(include_tab[0] && include_tab[0].grid){
//                var selectedRow = include_tab[0].grid.getSelectionModel().getSelected();
//                id = selectedRow ? selectedRow.id : 0;
//                url = Inflector.pluralize(include_tab[0].model)+"/"+id+"/"+url;
//            }
//        }
               switch (action) {
                   case "index":
                       return this.root + "/" + this.resource + this.ext;
                       break;
                   case "new":
                       return this.root + "/" + this.resource + "/new" + this.ext;
                   case "create":
                       return this.root + "/" + this.resource + this.ext;
                       break;
                   case "update":
                       return this.root + "/" + this.resource + "/" + id + this.ext;
                       break;
                   case "edit":
                       return this.root + "/" + this.resource + "/" + id + "/edit"+ this.ext;
                       break;
                   case "delete":
                       return this.root + "/" + this.resource + "/" + id + this.ext;
                       break;
                   default:
                       return this.root + "/" + this.resource + "/" + id + "/" + action + this.ext;
                       break;
               }
    },
    getName:function(){
        return this.model_class;
    }
});