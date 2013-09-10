LiveTogether.Views.UsersIndex = Backbone.View.extend({

  template: JST['users/index'],

  className: 'panel large-12 columns',

  initialize: function(){
    this.listenTo(this.collection, 'add', this.addOne);
    this.collection.fetch();
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  },

  addOne: function(){

  }

});
