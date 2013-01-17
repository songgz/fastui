Ext.define('FastUI.view.Rest', {
    constructor:function (entity_class) {
        this.entity_class = entity_class;
        this.ext = '.json';
        this.path = this.entity_class.underscore().pluralize();
    },
    getClassName:function(){
        return this.entity_class.demodulize();
    },
    getTableName:function(){
        return this.getClassName().underscore();
    },
    getKey:function(){
        return this.getTableName() + '_id';
    },
    getTitle:function(){
        return this.getTableName() + '_title';
    },
    newPath:function(){
        return this.path + "/new" + this.ext;
    },
    editPath:function(id){
        return this.path + "/" + id + "/edit"+ this.ext;
    },
    showPath:function(id){
        return this.path + "/" + id + this.ext;
    },
    updatePath:function(id){
        return this.path + "/" + id + this.ext;
    },
    createPath:function(){
        return this.path + this.ext;
    },
    indexPath:function(){
        return this.path + this.ext;
    },
    deletePath:function(id){
        return this.path + "/" + id + this.ext;
    }
});