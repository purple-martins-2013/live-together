LiveTogether.Views.ListsIndex = Backbone.View.extend({

  template: JST['lists/index'],

  className: 'panel large-12 columns',

  initialize: function(){
    this.listenTo(this.collection, 'add', this.addOne);
    this.collection.fetch();
  },

  events: {
    "click .new-list": "newListForm"
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  },

  addOne: function(model){
    var view = new LiveTogether.Views.ListDashboard({model: model});
    this.$el.find('#listsContainer').append(view.render().el);
  },

  newListForm: function(){
    var view = new LiveTogether.Views.ListForm({collection: this.collection});
    this.$el.append(view.render().el);
  }

});
