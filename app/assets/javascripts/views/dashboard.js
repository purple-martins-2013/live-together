LiveTogether.Views.Dashboard = Backbone.View.extend({

  template: JST['house/dashboard'],

  scaffoldTemplate: JST['house/scaffold'],

  el: '#houseMain',

  initialize: function(){
    console.log('dashboard view initialized');

    // Initialize dashboard view
    this.$el.html(this.scaffoldTemplate());
    this.$info = this.$('#houseInfo');
    this.$leftPanel = this.$('#leftPanel');
    this.$rightPanel = this.$('#rightPanel');
    this.listenTo(this.model, 'change', this.render);
    this.model.fetch();

    // Initialize chores view
    var chores = new LiveTogether.Collections.Chores();
    this.choresView = new LiveTogether.Views.ChoresIndex({collection: chores});
    this.$leftPanel.html(this.choresView.render().el);

    // Initialize lists view
    this.lists = new LiveTogether.Collections.Lists();
    this.listsView = new LiveTogether.Views.ListsIndex({collection: this.lists});
    this.$rightPanel.append(this.listsView.render().el);

    // Initialize users view
    var users = new LiveTogether.Collections.Users();
    this.usersView = new LiveTogether.Views.UsersIndex({collection: users});
    this.$rightPanel.prepend(this.usersView.render().el);
  },

  render: function(){
    this.$info.html(this.template({house: this.model.attributes}));
    return this;
  },

  showList: function(id){
    console.log('list shown with id', id);
    var lists = this.lists.fetch();
    var that = this;
    lists.done(function(){
      var list = that.lists.get(id);
      var view = new LiveTogether.Views.List({model: list});
      that.listsView.$el.hide();
      that.usersView.$el.hide();
      that.$rightPanel.append(view.render().el);
    });
  },

  showCompletedChores: function(){
    var completed = new LiveTogether.Collections.CompletedChores();
    this.completedChoresView = new LiveTogether.Views.CompletedChoresIndex({collection: completed});
    this.choresView.$el.hide();
    this.$leftPanel.append(this.completedChoresView.render().el);
  }

});