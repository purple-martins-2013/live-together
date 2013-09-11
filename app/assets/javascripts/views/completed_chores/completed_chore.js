LiveTogether.Views.CompletedChore = Backbone.View.extend({

  template: JST['completed_chores/show'],

  tagName: 'tr',

  className: 'chore-item',

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
  },

  render: function(){
    this.$el.html(this.template(this.model.attributes));
    return this;
  }

});