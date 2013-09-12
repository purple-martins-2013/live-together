LiveTogether.Routers.Main = Backbone.Router.extend({

  routes: {
    "house": "houseDashboard",
    "lists/:id": "showList",
    "chores/completed": "showCompletedChores"
  },

  houseDashboard: function(){
    console.log('main house dash route triggered');
    var dashboard = this.getDashBoardView();
    dashboard.showChoresIndex();
    dashboard.showUsersIndex();
    dashboard.showListsIndex();
  },

  showList: function(id){
    console.log('show list route triggered with id', id);
    var dashboard = this.getDashBoardView();
    dashboard.showList(id);
    if (!dashboard.choresView){ dashboard.showChoresIndex(); }
  },

  showCompletedChores: function(){
    console.log('completed chores route triggered');
    var dashboard = this.getDashBoardView();
    dashboard.showCompletedChores();
    if (!dashboard.usersView) { dashboard.showUsersIndex(); }
    if (!dashboard.listsView) { dashboard.showListsIndex(); }
  },

  getDashBoardView: function(){
    if (this.dashboardView) {
      console.log('dashboard view retrieved from cache');
      return this.dashboardView;
    }
    console.log('new dashboard view created');
    var house = new LiveTogether.Models.House();
    this.dashboardView = new LiveTogether.Views.Dashboard({model: house});
    return this.dashboardView;
  }

});
