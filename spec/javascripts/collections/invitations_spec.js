describe("Tests for invitations collection", function(){

  beforeEach(function(){
    this.invitations = new LiveTogether.Collections.Invitations();
  });

  it("can add new model objects", function(){
    expect(this.invitations.length).toBe(0);
    var invitation = new LiveTogether.Models.Invitation();
    this.invitations.add(invitation);
    expect(this.invitations.length).toBe(1);
  });

  it("has the correct url", function(){
    expect(this.invitations.url).toBe('/invitations');
  });

});