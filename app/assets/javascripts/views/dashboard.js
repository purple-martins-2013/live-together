LiveTogether.Views.Dashboard = Backbone.View.extend({

  template: JST['dashboard'],

  el: '#houseMain',

  initialize: function(){
    console.log('dashboard view initialized');
    this.$info = this.$('#houseInfo');
    var that = this;
    this.listenTo(this.model, 'change', this.render);
    this.model.fetch();

    // Initialize chores view
    var chores = new LiveTogether.Collections.Chores();
    that.choresView = new LiveTogether.Views.ChoresIndex({collection: chores});
    that.$el.append(that.choresView.render().el);
  },

  render: function(){
    this.$info.html(this.template({house: this.model.attributes}));
    return this;
  }

});