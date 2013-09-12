LiveTogether.Views.ChoresIndex = Backbone.View.extend({

  template: JST['chores/index'],

  className: 'large-12 columns',

  initialize: function(){
    console.log('chores index view initialized');
    this.$el.html(this.template());
    this.listenTo(this.collection, 'add', this.addAll);
    this.listenTo(this.collection, 'reset', this.addAll);
    this.listenTo(this.collection, 'sort', this.addAll);
    if (this.collection.length === 0){
      this.collection.fetch({reset: true});
    } else {
      this.addAll();
    }
  },

  events: {
    "click .new-chore": "newChoreForm",
    "click .completed-chores": "completedChores"
  },

  render: function(){
    this.delegateEvents(this.events);
    return this;
  },

  addAll: function(){
    this.$el.find('tbody').empty();
    this.collection.each(this.addOne, this);
  },

  addOne: function(model){
    var view = new LiveTogether.Views.Chore({model: model});
    view.users = this.users;
    this.$el.find('tbody').append(view.render().el);
  },

  newChoreForm: function(){
    var view = new LiveTogether.Views.ChoreForm({collection: this.collection});
    this.$el.append(view.render().$el.hide().fadeIn());
  },

  completedChores: function(){
    LiveTogether.router.navigate('chores/completed', {trigger: true});
  }

});
