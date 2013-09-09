LiveTogether.Views.HouseDash = Backbone.View.extend({

  template: JST['house_dash'],

  el: '#houseMain',

  render: function(){
    this.$el.html(this.template({house: this.model.attributes}));
    return this;
  }

});