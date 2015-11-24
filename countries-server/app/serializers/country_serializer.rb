class CountrySerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :longitude,
             :latitude,
             :two_char_code,
             :code,
             :population,
             :custom_life,
             :expenditure_as_gdp

  def custom_life
    return 0 if object.life_expectancy.nil?
    split = object.life_expectancy.split("/")
    split.first.to_f / split.second.to_f
  end
end
