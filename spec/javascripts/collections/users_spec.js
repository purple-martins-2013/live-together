describe("Tests for users collection", function(){

  beforeEach(function(){
    this.users = new LiveTogether.Collections.Users();
  });

  it("can add new model objects", function(){
    expect(this.users.length).toBe(0);
    var user = new LiveTogether.Models.User();
    this.users.add(user);
    expect(this.users.length).toBe(1);
  });

  it("has the correct url", function(){
    expect(this.users.url).toBe('/users');
  });

});