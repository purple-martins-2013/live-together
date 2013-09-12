LiveTogether.Views.UserForm = Backbone.View.extend({

  template: JST['users/invite'],

  className: 'invite-user-form',

  events: {
    "submit" : "createInvitation",
    "click .cancel-form": "cancelForm"
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
    $('.invite-user').fadeIn();
    this.$el.fadeOut(function(){
      this.remove();
    });
  },

  cancelForm: function(){
    $('.invite-user').fadeIn();
    this.$el.fadeOut(function(){
      this.remove();
    });
  }

});