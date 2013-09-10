LiveTogether.Views.ListDashboard = Backbone.View.extend({

  template: JST['lists/show_dashboard'],

  tagName: 'li',

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
  },

  render: function(){
    this.$el.html(this.template({list: this.model.attributes}));
    return this;
  }

});