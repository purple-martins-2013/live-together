LiveTogether.Views.ListForm = Backbone.View.extend({

  template: JST['lists/new'],

  className: 'new-list-form',

  events: {
    "submit" : "createList",
    "click .cancel-form": "cancelForm"
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  },

  serialize: function(){
    return {
      name: this.$el.find("input[name='name']").val(),
    };
  },

  createList: function(e){
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
