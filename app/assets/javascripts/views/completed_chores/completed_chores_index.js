LiveTogether.Views.CompletedChoresIndex = Backbone.View.extend({

  template: JST['completed_chores/index'],

  className: 'panel large-12 columns',

  initialize: function(){
    console.log('completed chores index view initialized');
    this.listenTo(this.collection, 'add', this.addOne);
    this.collection.fetch();
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  },

  addOne: function(model){
    var view = new LiveTogether.Views.CompletedChore({model: model});
    this.$el.find('tbody').append(view.render().el);
  }

});
