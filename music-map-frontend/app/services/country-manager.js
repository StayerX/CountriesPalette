import Ember from 'ember';

export default Ember.Service.extend({
  store: Ember.inject.service(),
  countries: null,
  unitedStates: null,

  setAllCountries(countries) {
    this.set('countries', countries);
  },

  setUnitedStates() {
    var _this = this;
    var countries = this.get('countries');
    countries.forEach(function(country) {
      if (country.id == "228") {
        _this.set('unitedStates', country);
      }
    });
  }
});
