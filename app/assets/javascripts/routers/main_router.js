LiveTogether.Routers.Main = Backbone.Router.extend({

  routes: {
    "house": "houseDashboard",
    "house/lists/:id": "showList"
  },

  houseDashboard: function(){
    console.log('main house dash route triggered');
    var house = new LiveTogether.Models.House();
    var dashboardView = new LiveTogether.Views.Dashboard({model: house});
  },

  showList: function(id){
    console.log('show list route triggered with id', id);
  }

});
