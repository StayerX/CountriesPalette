import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  longitude: DS.attr('number'),
  latitude: DS.attr('number'),
  twoCharCode: DS.attr('string'),
  code: DS.attr('string'),
  population: DS.attr('number'),

  location: Ember.computed('longitude', 'latitude', function() {
    var lng = this.get('longitude') || 37.09024;
    var lat = this.get('latitude') || -95.712891;
    return [lng, lat];
  }),
});
