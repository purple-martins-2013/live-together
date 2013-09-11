LiveTogether.Views.Dashboard = Backbone.View.extend({

  template: JST['house/dashboard'],

  layoutTemplate: JST['house/layout'],

  el: '#houseMain',

  initialize: function(){
    console.log('dashboard view initialized');

    // Initialize dashboard view
    this.$el.html(this.layoutTemplate());
    this.$info = this.$('#houseInfo');
    this.$leftPanel = this.$('#leftPanel');
    this.$rightUpperPanel = this.$('#rightUpperPanel');
    this.$rightLowerPanel = this.$('#rightLowerPanel');
    this.listenTo(this.model, 'change', this.render);
    this.model.fetch();
  },

  render: function(){
    this.$info.html(this.template({house: this.model.attributes}));
    return this;
  },

  showChoresIndex: function(){
    this.chores = this.chores || new LiveTogether.Collections.Chores();
    this.choresView = new LiveTogether.Views.ChoresIndex({collection: this.chores});
    this.$leftPanel.html(this.choresView.render().el);
  },

  showListsIndex: function(){
    this.lists = this.lists || new LiveTogether.Collections.Lists();
    this.listsView = new LiveTogether.Views.ListsIndex({collection: this.lists});
    this.$rightLowerPanel.html(this.listsView.render().el);
  },

  showUsersIndex: function(){
    this.users = this.users || new LiveTogether.Collections.Users();
    this.usersView = new LiveTogether.Views.UsersIndex({collection: this.users});
    this.$rightUpperPanel.html(this.usersView.render().el);
    this.$rightUpperPanel.show();
  },

  showList: function(id){
    var list = new LiveTogether.Models.List({id: id});
    var lists = new LiveTogether.Collections.Lists();
    lists.add(list, {silent: true});
    var view = new LiveTogether.Views.List({model: list});
    this.$rightUpperPanel.hide();
    this.$rightLowerPanel.html(view.render().el);
  },

  showCompletedChores: function(){
    this.completedChores = this.completedChores || new LiveTogether.Collections.CompletedChores();
    this.completedChoresView = new LiveTogether.Views.CompletedChoresIndex({collection: this.completedChores});
    this.$leftPanel.html(this.completedChoresView.render().el);
  }
});