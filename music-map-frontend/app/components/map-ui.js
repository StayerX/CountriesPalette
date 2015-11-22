import Ember from 'ember';

export default Ember.Component.extend({
  countryManager: Ember.inject.service(),

  lat: 37.09024,
  lng: -95.712891,
  zoom: 4,
  sideBarCountry: "United States",
  countries: Ember.computed.alias('countryManager.countries'),

  actions: {
    setSideBarInfo(data) {
      var lat = data.latlng.lat;
      var lng = data.latlng.lng;
      var countries = this.get('countryManager.countries').get('content');
      var _this = this;
      countries.forEach(function(country) {
        var cnt = country._data
        if (cnt.latitude === lng && cnt.longitude === lat) {
          _this.set('sideBarCountry', cnt.name);
        }
      });
    },
  }
});

