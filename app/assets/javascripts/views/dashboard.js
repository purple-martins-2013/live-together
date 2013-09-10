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
    var lists = new LiveTogether.Collections.Lists();
    this.listsView = new LiveTogether.Views.ListsIndex({collection: lists});
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
    var items = new LiveTogether.Collections.Items();
  }

});