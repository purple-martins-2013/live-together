describe("Tests for chores collection", function(){

  beforeEach(function(){
    this.chores = new LiveTogether.Collections.Chores();
  });

  it("can add new model objects", function(){
    expect(this.chores.length).toBe(0);
    var chore = new LiveTogether.Models.Chore();
    this.chores.add(chore);
    expect(this.chores.length).toBe(1);
  });

  it("has the correct url", function(){
    expect(this.chores.url).toBe('/chores');
  });

});