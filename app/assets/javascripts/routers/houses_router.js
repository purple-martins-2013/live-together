LiveTogether.Routers.Houses = Backbone.Router.extend({

  routes: {
    "house": "houseDash"
  },

  houseDash: function(){
    console.log('main house dash route triggered');
    var house = new LiveTogether.Models.House();
    var houseView = new LiveTogether.Views.HouseDash({model: house });
    houseView.render();
  }

});
