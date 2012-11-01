Ext.define('FastUI.view.RestHelper', {
    name:'restHelper',

    constructor:function (model_class) {
        this.model_class = model_class;
        if(this.model_class){
            this.resource = Inflector.pluralize(model_class.toLowerCase());
        }
        this.root = '/fastui';
        this.ext = '.json';
    },
    getPath:function(action, id){
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