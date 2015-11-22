import Ember from 'ember';
import ENV from '../config/environment';

import EmberLeafletComponent from 'ember-leaflet/components/leaflet-map';

export default EmberLeafletComponent.extend({
  _register: function() {
    this.set('register-as', this); // register-as is a new property
    debugger;
  }.on('init'),

  updateCenter() {
    debugger;
  }

});
