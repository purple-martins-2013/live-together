LiveTogether.Collections.Chores = Backbone.Collection.extend({

  model: LiveTogether.Models.Chore,
  url: '/chores',

  comparator: function(chore) {
    return chore.get('due_date');
  }

});
