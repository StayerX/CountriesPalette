class CountrySerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :longitude,
             :latitude,
             :two_char_code,
             :code,
             :population,
             :life_expectancy,
             :expenditure_as_gdp
end
