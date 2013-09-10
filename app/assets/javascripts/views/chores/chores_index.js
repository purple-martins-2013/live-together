LiveTogether.Views.ChoresIndex = Backbone.View.extend({

  template: JST['chores/index'],

  className: 'large-12 columns',

  initialize: function(){
    console.log('chores index view initialized');
    this.$el.html(this.template());
    this.listenTo(this.collection, 'add', this.addOne);
    this.listenTo(this.collection, 'reset', this.addAll);
    this.collection.fetch();
  },

  events: {
    "click .new-chore": "newChoreForm"
  },

  addAll: function(){
    console.log('addAll executed');
  },

  addOne: function(model){
    var view = new LiveTogether.Views.Chore({model: model});
    this.$el.find('tbody').append(view.render().el);
  },

  newChoreForm: function(){
    var view = new LiveTogether.Views.ChoreForm({collection: this.collection});
    this.$el.append(view.render().$el.hide().fadeIn());
  }

});
