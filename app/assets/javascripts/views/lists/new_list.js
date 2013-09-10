LiveTogether.Views.ListForm = Backbone.View.extend({

  template: JST['lists/new'],

  tagName: 'form',

  className: 'new-list-form',

  events: {
    "submit" : "createList"
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
  }

});
