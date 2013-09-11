LiveTogether.Views.ItemForm = Backbone.View.extend({

  template: JST['items/new'],

  className: 'new-item-form',

  events: {
    "submit" : "createItem",
    "click .cancel-form": "cancelForm"
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  },

  serialize: function(){
    return {
      name: this.$el.find("input[name='name']").val()
    };
  },

  createItem: function(e){
    e.preventDefault();
    this.collection.create(this.serialize());
    this.$el.fadeOut(function(){
      this.remove();
    });
  },

  cancelForm: function(){
    this.$el.fadeOut(function(){
      this.remove();
    });
  }

});