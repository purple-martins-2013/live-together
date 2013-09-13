describe("List model", function(){

  var list = new LiveTogether.Models.List({id: 37});

  it("has a collection of items", function(){
    expect(list.items).not.toBe(undefined);
  });

  it("assigns the correct url to the collection of items", function(){
    expect(list.items.url).toBe("/grocery_lists/37/grocery_items");
  });
});