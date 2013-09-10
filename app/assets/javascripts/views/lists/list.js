LiveTogether.Views.List = Backbone.View.extend({

  template: JST['lists/show'],

  className: 'large-12 columns',

  initialize: function(){
    console.log('show list view initialized with id:', this.model.id);
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model.items, 'add', this.addOne);
    this.model.items.fetch();
  },

  render: function(){
    this.$el.html(this.template({list: this.model.attributes}));
    return this;
  },

  addOne: function(model){
    console.log('item view rendered:', model);
    var view = new LiveTogether.Views.Item({model: model});
    this.$el.find('#itemsContainer').append(view.render().el);
  }

});