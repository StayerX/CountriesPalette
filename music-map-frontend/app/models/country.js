import DS from 'ember-data';
import Ember from 'ember';

export default DS.Model.extend({
  name: DS.attr('string'),
  longitude: DS.attr('number'),
  latitude: DS.attr('number'),
  twoCharCode: DS.attr('string'),
  code: DS.attr('string'),
  population: DS.attr('number'),
  lifeExpectancy: DS.attr('number'),
  dyingBetweenSixty: DS.attr('number'),
  expenditureAsGdp: DS.attr('number'),
});
