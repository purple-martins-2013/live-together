LiveTogether.Models.List = Backbone.Model.extend({

  initialize: function(){
    this.items = new LiveTogether.Collections.Items();
    this.items.url = '/grocery_lists/' + this.id + '/grocery_items';
  }

});
