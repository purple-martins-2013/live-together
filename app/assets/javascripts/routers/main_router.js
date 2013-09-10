LiveTogether.Routers.Main = Backbone.Router.extend({

  routes: {
    "": "houseDashboard",
    "lists/:id": "showList"
  },

  houseDashboard: function(){
    console.log('main house dash route triggered');
    this.getDashBoardView();
  },

  showList: function(id){
    console.log('show list route triggered with id', id);
    this.getDashBoardView().showList(id);
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
