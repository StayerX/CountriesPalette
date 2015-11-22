import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    sideBar: function(data) {
      this.render({controller: 'side-bar'});
    }
  }
})
