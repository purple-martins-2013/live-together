LiveTogether.Views.UserForm = Backbone.View.extend({

  template: JST['users/invite'],

  tagName: 'form',

  className: 'invite-user-form',

  events: {
    "submit" : "createInvitation"
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  },

  serialize: function(){
    return {
      email: this.$el.find("input[name='email']").val(),
    };
  },

  createInvitation: function(e){
    e.preventDefault();
    this.collection.create(this.serialize());
    this.$el.fadeOut(function(){
      this.remove();
    });
  }

});