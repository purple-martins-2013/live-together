describe("main router", function(){
  beforeEach(function(){
    this.router = new LiveTogether.Routers.Main();

    this.routerSpy = jasmine.createSpy('routerSpy');

    try {
      Backbone.history.start({
        silent: true
      });
    } catch(e){

    }
  });

  it("true should be true", function(){
    expect(true).toBe(true);
  });

  it('should call the house route correctly', function(){
    this.router.bind('route:house', this.routerSpy, this);
    this.router.navigate('house', {trigger: true});

    expect(this.routerSpy).toHaveBeenCalledOnce();
  });
});