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
  markers: null,

  didInsertElement() {
    var map = L.map('leaflet', {
      center: [this.get('lat'), this.get('lng')],
      zoom: this.get('zoom')
    });

    L.tileLayer('http://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png', {
      maxZoom: this.get('maxZoom'),
      minZoom: this.get('minZoom')
    }).addTo(map);

    var _this = this;
    var countries = this.get('countries');
    countries.forEach(function(country) {
      var lng = country.get('longitude') || 37.09024;
      var lat = country.get('latitude') || -95.712891;
      var marker = L.marker([lng, lat]).addTo(map);
      marker.addEventListener('click', function(e) {
        _this.send('setSideBarInfo', e);
      });
    });

    this.set('map', map);
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
          var map = _this.get('map');
          map.panTo(new L.LatLng(cnt.longitude, cnt.latitude));
        }
      });
      _this.set('searchText', null);
    }
  }
});

