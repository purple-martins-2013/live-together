LiveTogether.Views.ChoresIndex = Backbone.View.extend({

  template: JST['chores/index'],

  className: 'panel large-6 columns',

  initialize: function(){
    this.listenTo(this.collection, 'add', this.addOne);
    this.listenTo(this.collection, 'reset', this.addAll);
    this.collection.fetch({
      reset: true,
      success: function(){
        console.log('chores fetch successful');
      }
    });
  },

  events: {
    "click .new-chore": "newChoreForm"
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  },

  addAll: function(){
    console.log('addAll executed');
  },

  addOne: function(model){
    var view = new LiveTogether.Views.Chore({model: model});
    this.$el.find('tbody').append(view.render().el);
  },

  newChoreForm: function(){
    var view = new LiveTogether.Views.ChoreForm();
    this.$el.append(view.render().$el.hide().fadeIn());
  }

});
