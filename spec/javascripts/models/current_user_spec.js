describe("Current user model", function(){

  var current_user = new LiveTogether.Models.CurrentUser();

  it("has the correct url", function(){
    expect(current_user.url).toBe('/current_user');
  });

});