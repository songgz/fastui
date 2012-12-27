Ext.define('FastUI.view.Rest', {
    constructor:function (entity) {
        this.entity = entity;
        this.ext = '.json';
        this.path = this.entity.name.underscore().pluralize();
    },
    getClassName:function(){
        return this.entity.name.demodulize();
    },
    getTableName:function(){
        return this.getClassName().underscore();
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