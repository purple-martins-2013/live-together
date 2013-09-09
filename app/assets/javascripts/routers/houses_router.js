LiveTogether.Routers.Houses = Backbone.Router.extend({

  routes: {
    "house": "houseDash"
  },

  initialize: function(){
    var house = new LiveTogether.Models.House();
    house.fetch({
      success: function(){
        LiveTogether.Views.Created.houseDash = new LiveTogether.Views.HouseDash({model: house});
        LiveTogether.Views.Created.houseDash.render();
      }
    });
  },

  houseDash: function(){
    console.log('main house dash route triggered');
  }

});
