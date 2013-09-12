LiveTogether.Views.ListsIndex = Backbone.View.extend({

  template: JST['lists/index'],

  className: 'large-12 columns',

  initialize: function(){
    this.$el.html(this.template());
    this.listenTo(this.collection, 'add', this.addOne);
    if (this.collection.length === 0){
      this.collection.fetch();
    } else {
      this.addAll();
    }
  },

  events: {
    "click .new-list": "newListForm"
  },

  render: function(){
    this.delegateEvents(this.events);
    return this;
  },

  addAll: function(){
    this.collection.each(this.addOne, this);
  },

  addOne: function(model){
    var view = new LiveTogether.Views.ListDashboard({model: model});
    this.$el.find('#listsContainer').append(view.render().el);
  },

  newListForm: function(){
    var view = new LiveTogether.Views.ListForm({collection: this.collection});
    this.$el.append(view.render().$el.hide().fadeIn());
  }

});
