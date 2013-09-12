LiveTogether.Views.CompletedChoresIndex = Backbone.View.extend({

  template: JST['completed_chores/index'],

  className: 'large-12 columns',

  initialize: function(){
    console.log('completed chores index view initialized');
    this.$el.html(this.template());
    this.listenTo(this.collection, 'add', this.addOne);
    this.collection.fetch();
  },

  events: {
    "click .view-chores": "viewChores"
  },

  addAll: function(){
    this.collection.each(this.addOne, this);
  },

  addOne: function(model){
    var view = new LiveTogether.Views.CompletedChore({model: model});
    this.$el.find('tbody').append(view.render().el);
  },

  viewChores: function(){
    LiveTogether.router.navigate('house', {trigger: true});
  }

});
