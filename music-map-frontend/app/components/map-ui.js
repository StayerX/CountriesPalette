import Ember from 'ember';

export default Ember.Component.extend({
  countryManager: Ember.inject.service(),

  lat: 37.09024,
  lng: -95.712891,
  zoom: 4,
  minZoom: 2,
  maxZoom: 4,
  sideBarCountry: null,
  countries: Ember.computed.alias('countryManager.countries'),
  searchText: null,
  map: null,

  didInsertElement() {
    var map = L.map('leaflet', { center: [this.get('lat'), this.get('lng')],
      zoom: this.get('zoom')
    });
    this.set('map', map);

    L.tileLayer('http://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png', {
      maxZoom: this.get('maxZoom'),
    }).addTo(map);
  },

  actions: {
    setSideBarInfo(data) {
      var lat = data.latlng.lat;
      var lng = data.latlng.lng;
      var countries = this.get('countryManager.countries').get('content');
      var _this = this;
      countries.forEach(function(country) {
        var cnt = country._data;
        if (cnt.latitude === lng && cnt.longitude === lat) {
          _this.set('sideBarCountry', cnt);
        }
      });
    },

    searchForCountry(data) {
      var countryName = data.trim().toLowerCase();
      var countries = this.get('countryManager.countries').get('content');
      var _this = this;
      countries.forEach(function(country) {
        var cnt = country._data;
        if (cnt.name && cnt.name.trim().toLowerCase() === countryName) {
          _this.set('lng', cnt.latitude);
          _this.set('lat', cnt.longitude);
          _this.set('sideBarCountry', cnt);
        }
      });
      _this.set('searchText', null);
    }
  }
});

