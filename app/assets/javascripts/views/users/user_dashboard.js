LiveTogether.Views.UserDashboard = Backbone.View.extend({

  template: JST['users/show_dashboard'],

  tagName: 'tr',

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
  },

  render: function(){
    this.$el.html(this.template({user: this.model.attributes}));
    return this;
  },

});
