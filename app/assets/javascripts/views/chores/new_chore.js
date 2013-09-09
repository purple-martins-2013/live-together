LiveTogether.Views.ChoreForm = Backbone.View.extend({

  template: JST['chores/new'],

  tagName: 'form',

  className: 'new-chore-form',

  events: {
    "submit" : "createChore"
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
    LiveTogether.Collections.Created.chores.create(this.serialize());
    this.$el.fadeOut(function(){
      this.remove();
    });
  }

});