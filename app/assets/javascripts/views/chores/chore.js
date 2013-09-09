LiveTogether.Views.Chore = Backbone.View.extend({

  template: JST['chores/show'],

  tagName: 'tr',

  className: 'chore-item',

  events: {
    "click .complete-chore" : "completeChore"
  },

  render: function(){
    this.$el.html(this.template({chore: this.model.attributes}));
    return this;
  },

  completeChore: function(){
    
  }

});