import Ember from 'ember';

export default Ember.Service.extend({
  store: Ember.inject.service(),
  countries: null,

  setAllCountries(countries) {
    this.set('countries', countries);
  },
});
