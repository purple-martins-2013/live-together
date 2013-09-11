LiveTogether.Views.Chore = Backbone.View.extend({

  template: JST['chores/show'],

  tagName: 'tr',

  className: 'chore-item',

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
  },

  events: {
    "click .complete-chore" : "completeChore"
  },

  render: function(){
    this.$el.html(this.template({chore: this.model.attributes}));
    return this;
  },

  completeChore: function(){
    var that = this;
    this.model.save({last_completed: new Date()}, {
      wait: true,
      patch: true
    }).done(function(){
      that.model.collection.sort();
    });
  }

});