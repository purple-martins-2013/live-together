LiveTogether.Views.ChoreForm = Backbone.View.extend({

  template: JST['chores/new'],

  className: 'new-chore-form',

  events: {
    "submit" : "createChore",
    "click .cancel-form": "cancelForm"
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  },

  serialize: function(){
    return {
      title: this.$el.find("input[name='title']").val(),
      points: this.$el.find("input[name='points']").val(),
      frequency: this.$el.find("input[name='frequency']:checked").val()
    };
  },

  createChore: function(e){
    e.preventDefault();
    this.collection.create(this.serialize(), {wait: true});
    $('.new-chore').fadeIn();
    this.$el.fadeOut(function(){
      this.remove();
    });
  },

  cancelForm: function(){
    $('.new-chore').fadeIn();
    this.$el.fadeOut(function(){
      this.remove();
    });
  }

});