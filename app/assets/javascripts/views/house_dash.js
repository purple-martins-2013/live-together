LiveTogether.Views.HouseDash = Backbone.View.extend({

  template: JST['house_dash'],

  el: '#houseMain',

  initialize: function() {
    var chores = new LiveTogether.Collections.Chores();
    this.choresView = new LiveTogether.Views.ChoresIndex({ collection: chores });
    this.$el.append(this.choresView.render().el);
    this.listenTo(this.model, 'change', this.render)
    this.model.fetch();
  },
  render: function(){
    this.$el.html(this.template({house: this.model.attributes}));
    return this;
  }

});
