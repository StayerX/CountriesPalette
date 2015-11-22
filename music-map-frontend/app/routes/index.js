import Ember from 'ember';

export default Ember.Route.extend({
  countryManager: Ember.inject.service(),

  model: function() {
    return Ember.RSVP.all([
      this.store.findAll('country')
    ]);
  },

  setupController: function(controller, models) {
    this.get('countryManager').setAllCountries(models[0]);
    this.get('countryManager').setUnitedStates();
  },

  actions: {
    sideBar: function() {
      this.render({controller: 'side-bar'});
    }
  }
});
