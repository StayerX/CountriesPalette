# Given a postgres database with a table called 'countries' with fields ['name' 'two_char_code' 'longitude' 'latitude']
# This script will parse the below website and fill that table with the data from all countries

require 'nokogiri'
require 'open-uri'
require 'active_record'
require 'pg'
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'countries_pallete',
  host: 'localhost',
  port: '5432',
  username: 'smeriwether',
  password: ''
)

class Country < ActiveRecord::Base; end

page = Nokogiri::HTML(open('https://developers.google.com/public-data/docs/canonical/countries_csv'))
two_char_code = []
lattitude = []
longitude = []
name = []
page.css('table').first.css('tr').each do |row|
  row = row.text.split("\n").map(&:strip)
  next if row[1] == 'country'
  two_char_code << row[1]
  lattitude << row[2]
  longitude << row[3]
  name << row[4]
end

two_char_code.zip(lattitude).zip(longitude).zip(name).each do |country|
  country = country.flatten
  c = Country.new
  c.two_char_code = country[0]
  c.longitude = country[1]
  c.latitude = country[2]
  c.name = country[3]
  c.save!
end
