import Ember from 'ember';

export default Ember.Component.extend({

  formattedCountryName: Ember.computed('countryName', function() {
    var name = this.get('countryName');
    if (name) {
      return name;
    } else {
      return "Country Not Found";
    }
  }),

  formattedPopulation: Ember.computed('population', function() {
    var pop = this.get('population');
    if (pop) {
      return pop;
    } else {
      return "N/A";
    }
  }),
});

