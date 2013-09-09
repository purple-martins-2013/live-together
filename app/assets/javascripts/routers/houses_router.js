LiveTogether.Routers.Houses = Backbone.Router.extend({

  routes: {
    "house": "houseDash"
  },

  houseDash: function(){
    console.log('main house dash route triggered');
    LiveTogether.Collections.Created.chores = new LiveTogether.Collections.Chores();
    LiveTogether.Views.Created.choresIndex = new LiveTogether.Views.ChoresIndex({collection: LiveTogether.Collections.Created.chores});
    LiveTogether.Views.Created.houseDash.$el.append(LiveTogether.Views.Created.choresIndex.render().el);
    LiveTogether.Collections.Created.chores.fetch({
      success: function(){
        console.log('chores fetch successful');
      }
    });
  }

});
