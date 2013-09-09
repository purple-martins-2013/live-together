LiveTogether.Routers.Main = Backbone.Router.extend({

  routes: {
    "house": "houseDashboard",
    "user/:id": "userProfile"
  },

  houseDashboard: function(){
    console.log('main house dash route triggered');
    var house = new LiveTogether.Models.House();
    var dashboardView = new LiveTogether.Views.Dashboard({model: house});
  },

  userProfile: function(id){
    console.log('user profile route triggered with id:', id);
  }

});
