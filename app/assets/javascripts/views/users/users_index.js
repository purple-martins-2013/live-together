LiveTogether.Views.UsersIndex = Backbone.View.extend({

  template: JST['users/index'],

  className: 'large-12 columns',

  initialize: function(){
    this.$el.html(this.template());
    this.listenTo(this.collection, 'add', this.addOne);
    this.collection.fetch();
  },

  events: {
    "click .invite-user": "newUserForm"
  },

  addOne: function(model){
    var view = new LiveTogether.Views.UserDashboard({model: model});
    this.$el.find('#usersContainer').append(view.render().el);
  },

  newUserForm: function(){
    var view = new LiveTogether.Views.UserForm({collection: new LiveTogether.Collections.Invitations()});
    this.$el.append(view.render().el);
  }

});
