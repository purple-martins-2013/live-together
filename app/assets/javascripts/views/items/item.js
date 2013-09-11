LiveTogether.Views.Item = Backbone.View.extend({

  template: JST['items/show'],

  tagName: 'li',

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
  },

  render: function(){
    this.$el.html(this.template({item: this.model.attributes}));
    return this;
  }

});
