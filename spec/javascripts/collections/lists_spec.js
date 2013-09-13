describe("Tests for lists collection", function(){

  beforeEach(function(){
    this.lists = new LiveTogether.Collections.Lists();
  });

  it("can add new model objects", function(){
    expect(this.lists.length).toBe(0);
    var list = new LiveTogether.Models.List();
    this.lists.add(list);
    expect(this.lists.length).toBe(1);
  });

  it("has the correct url", function(){
    expect(this.lists.url).toBe('/grocery_lists');
  });

});