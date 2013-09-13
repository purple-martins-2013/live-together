LiveTogether.Views.List = Backbone.View.extend({

  template: JST['lists/show'],

  className: 'large-12 columns',

  initialize: function(){
    console.log('show list view initialized with id:', this.model.id);
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model.items, 'add', this.addOne);
    this.model.fetch();
    this.model.items.fetch();
  },

  events: {
    "click .new-item": "newItemForm",
    "click .all-lists": "allLists",
    "click #subscribe": "subscribe",
    "click #unsubscribe": "unsubscribe",
    "click .button.secondary": "formModal"
  },

  render: function(){
    this.$el.html(this.template({list: this.model.attributes}));
    return this;
  },

  addAll: function(){
    this.model.items.each(this.addOne, this);
  },

  addOne: function(model){
    var view = new LiveTogether.Views.Item({model: model});
    this.$el.find('#itemsContainer').append(view.render().el);
  },

  newItemForm: function(){
    $('.new-item').fadeOut();
    var view = new LiveTogether.Views.ItemForm({collection: this.model.items});
    this.$el.append(view.render().$el.hide().fadeIn());
  },

  allLists: function(){
    LiveTogether.router.navigate('house', {trigger: true});
  },

  subscribe: function(e){
    e.preventDefault();
    var that = this;
    $.post('/subscribe', { id: this.model.id }).done(function(){
      that.model.fetch({
        success: function(){
          that.addAll();
        }
      });
    });
  },

  unsubscribe: function(e){
    e.preventDefault();
    var that = this;
    $.post('/unsubscribe', { id: this.model.id }).done(function(){
      that.model.fetch({
        success: function(){
          that.addAll();
        }
      });
    });
  },

  formModal: function(e){
    e.preventDefault();
    $.get("/new_from_grocery_list/"+this.model.id, function(response){
      $('#myModal').html(response);
      $('#myModal').foundation('reveal', 'open');
    });
  }

});